import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/core_providers.dart';
import '../../interactions/data/interactions_repository.dart';
import '../../interactions/domain/interaction.dart';
import '../../people/domain/person.dart';
import '../../relationships/presentation/relationship_providers.dart';
import '../../reminders/data/reminders_repository.dart';
import '../../reminders/domain/upcoming.dart';
import '../../tags/data/tags_repository.dart';

final interactionsRepositoryProvider = Provider<InteractionsRepository>(
  (ref) => InteractionsRepository(
    db: ref.watch(appDatabaseProvider),
    outbox: ref.watch(outboxWriterProvider),
    ids: ref.watch(idGeneratorProvider),
    clock: ref.watch(clockProvider),
  ),
);

final remindersRepositoryProvider = Provider<RemindersRepository>(
  (ref) => RemindersRepository(
    db: ref.watch(appDatabaseProvider),
    outbox: ref.watch(outboxWriterProvider),
    ids: ref.watch(idGeneratorProvider),
    clock: ref.watch(clockProvider),
  ),
);

final tagsRepositoryProvider = Provider<TagsRepository>(
  (ref) => TagsRepository(
    db: ref.watch(appDatabaseProvider),
    outbox: ref.watch(outboxWriterProvider),
    ids: ref.watch(idGeneratorProvider),
    clock: ref.watch(clockProvider),
  ),
);

final interactionsProvider = StreamProvider<List<Interaction>>(
  (ref) => ref.watch(interactionsRepositoryProvider).watchAll(),
);

final personInteractionsProvider = StreamProvider.autoDispose.family<List<Interaction>, String>(
  (ref, personId) => ref.watch(interactionsRepositoryProvider).watchAll(personId: personId),
);

final interactionProvider = StreamProvider.autoDispose.family<Interaction?, String>(
  (ref, id) => ref.watch(interactionsRepositoryProvider).watchById(id),
);

final lastMetProvider = StreamProvider<Map<String, DateTime>>(
  (ref) => ref.watch(interactionsRepositoryProvider).watchLastMet(),
);

final openRemindersProvider = StreamProvider<List<ReminderInfo>>(
  (ref) => ref.watch(remindersRepositoryProvider).watchOpen(),
);

final marriageDatesProvider = StreamProvider<List<MarriageDate>>(
  (ref) => ref.watch(remindersRepositoryProvider).watchMarriageDates(),
);

final tagsProvider = StreamProvider<List<Tag>>((ref) => ref.watch(tagsRepositoryProvider).watchAll());

final tagAssignmentsProvider = StreamProvider<Map<String, Set<String>>>(
  (ref) => ref.watch(tagsRepositoryProvider).watchAssignments(),
);

/// Birthdays, anniversaries, barsi and follow-ups in the next [days] days.
final agendaProvider = Provider.family<List<UpcomingItem>, int>((ref, days) {
  final people = ref.watch(peopleByIdProvider).value?.values ?? const <Person>[];
  final marriages = ref.watch(marriageDatesProvider).value ?? const [];
  final reminders = ref.watch(openRemindersProvider).value ?? const [];
  return Agenda.build(today: DateTime.now(), days: days, people: people, marriages: marriages, reminders: reminders);
});

/// People you have met before but not in the last [days] days.
final reconnectProvider = Provider.family<List<(Person, DateTime)>, int>((ref, days) {
  final lastMet = ref.watch(lastMetProvider).value ?? const {};
  final people = ref.watch(peopleByIdProvider).value ?? const {};
  final cutoff = DateTime.now().subtract(Duration(days: days));
  final list = [
    for (final e in lastMet.entries)
      if (people[e.key] case final p? when !p.isSelf && e.value.isBefore(cutoff)) (p, e.value),
  ]..sort((a, b) => a.$2.compareTo(b.$2));
  return list;
});
