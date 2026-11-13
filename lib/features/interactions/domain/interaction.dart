import 'package:meta/meta.dart';

/// Kinds of interaction (matches the SQL CHECK constraint).
const interactionTypes = ['in_person', 'visit', 'phone_call', 'video_call', 'message', 'event', 'other'];

/// A meeting, call, visit or event with one or more people.
@immutable
final class Interaction {
  const Interaction({
    required this.id,
    required this.type,
    required this.occurredAt,
    required this.participantIds,
    this.title,
    this.placeId,
    this.locationText,
    this.notes,
    this.followUpOn,
  });

  final String id;
  final String type;
  final DateTime occurredAt;
  final List<String> participantIds;
  final String? title;
  final String? placeId;
  final String? locationText;
  final String? notes;
  final DateTime? followUpOn;

  InteractionDraft toDraft() => InteractionDraft(
    type: type,
    occurredAt: occurredAt,
    participantIds: participantIds,
    title: title,
    placeId: placeId,
    locationText: locationText,
    notes: notes,
    followUpOn: followUpOn,
  );
}

@immutable
final class InteractionDraft {
  const InteractionDraft({
    required this.occurredAt,
    required this.participantIds,
    this.type = 'in_person',
    this.title,
    this.placeId,
    this.locationText,
    this.notes,
    this.followUpOn,
    this.followUpNote,
  });

  final String type;
  final DateTime occurredAt;
  final List<String> participantIds;
  final String? title;
  final String? placeId;
  final String? locationText;
  final String? notes;

  /// Creates a follow-up reminder for this date when set.
  final DateTime? followUpOn;
  final String? followUpNote;
}
