import 'dart:isolate';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinship/kinship.dart';

import '../../../core/di/core_providers.dart';
import '../../people/domain/person.dart';
import '../../people/presentation/people_providers.dart';
import '../data/graph_repository.dart';

final graphRepositoryProvider = Provider<GraphRepository>(
  (ref) => GraphRepository(
    db: ref.watch(appDatabaseProvider),
    outbox: ref.watch(outboxWriterProvider),
    ids: ref.watch(idGeneratorProvider),
    people: ref.watch(peopleRepositoryProvider),
    clock: ref.watch(clockProvider),
  ),
);

/// The whole family graph, rebuilt whenever people or edges change.
final familyGraphProvider = StreamProvider<FamilyGraph>((ref) => ref.watch(graphRepositoryProvider).watchGraph());

/// Every live person by id (placeholders included).
final peopleByIdProvider = StreamProvider<Map<String, Person>>(
  (ref) => ref.watch(peopleRepositoryProvider).watchAll().map((list) => {for (final p in list) p.id: p}),
);

/// A relation path and its bilingual name.
final class RelationInfo {
  const RelationInfo(this.path, this.name);

  final KinPath path;
  final RelationName name;

  String label(BuildContext context) => name.label(hindi: Localizations.localeOf(context).languageCode == 'hi');
}

/// How everyone is related to you — one shortest-path pass over the graph
/// (blueprint §4.6). Large graphs are processed in a background isolate.
final relationsToMeProvider = FutureProvider<Map<String, RelationInfo>>((ref) async {
  final graph = await ref.watch(familyGraphProvider.future);
  final self = await ref.watch(selfPersonProvider.future);
  if (self == null) return const {};
  final selfId = self.id;
  Map<String, RelationInfo> compute() => {
    for (final e in PathFinder(graph).findAllFrom(selfId).entries)
      e.key: RelationInfo(e.value, RelationNamer.name(e.value)),
  };
  return graph.size > 1500 ? Isolate.run(compute) : compute();
});

/// Relation of one person to you (null while loading or not connected).
final relationToMeProvider = Provider.family<RelationInfo?, String>(
  (ref, personId) => ref.watch(relationsToMeProvider).value?[personId],
);

/// Parents, partners, siblings and children of one person.
final class ImmediateFamily {
  const ImmediateFamily({
    required this.parents,
    required this.partners,
    required this.formerPartners,
    required this.siblings,
    required this.children,
  });

  final List<String> parents;
  final List<String> partners;
  final List<String> formerPartners;
  final List<String> siblings;
  final List<String> children;

  bool get isEmpty =>
      parents.isEmpty && partners.isEmpty && formerPartners.isEmpty && siblings.isEmpty && children.isEmpty;
}

final immediateFamilyProvider = Provider.family<ImmediateFamily?, String>((ref, id) {
  final graph = ref.watch(familyGraphProvider).value;
  if (graph == null || !graph.contains(id)) return null;
  final current = graph.spousesOf(id);
  return ImmediateFamily(
    parents: graph.parentsOf(id),
    partners: current,
    formerPartners: graph.spousesOf(id, includeFormer: true).where((p) => !current.contains(p)).toList(),
    siblings: graph.siblingsOf(id),
    children: graph.childrenOf(id),
  );
});

/// Relation of [to] as seen from [from] (e.g. for rows on a profile).
final relationBetweenProvider = Provider.family<RelationInfo?, ({String from, String to})>((ref, pair) {
  final graph = ref.watch(familyGraphProvider).value;
  if (graph == null) return null;
  final path = PathFinder(graph).find(pair.from, pair.to);
  return path == null ? null : RelationInfo(path, RelationNamer.name(path));
});

/// Everyone related to a person beyond immediate family, nearest first.
final extendedFamilyProvider = Provider.family<List<(String, RelationInfo)>, String>((ref, id) {
  final graph = ref.watch(familyGraphProvider).value;
  if (graph == null || !graph.contains(id)) return const [];
  final immediate = {
    id,
    ...graph.parentsOf(id),
    ...graph.spousesOf(id, includeFormer: true),
    ...graph.siblingsOf(id),
    ...graph.childrenOf(id),
  };
  final all = PathFinder(graph).findAllFrom(id, includeSocial: false).entries.where((e) => !immediate.contains(e.key));
  final list = [for (final e in all) (e.key, RelationInfo(e.value, RelationNamer.name(e.value)))]
    ..sort((a, b) => a.$2.path.steps.length.compareTo(b.$2.path.steps.length));
  return list;
});

/// Social ties of a person: (other person id, connection type).
final socialTiesProvider = Provider.family<List<(String, String)>, String>((ref, id) {
  final graph = ref.watch(familyGraphProvider).value;
  if (graph == null) return const [];
  return [for (final e in graph.socialEdgesOf(id)) (e.aId == id ? e.bId : e.aId, e.type)];
});
