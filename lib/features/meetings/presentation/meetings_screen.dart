import 'package:flutter/material.dart';

import '../../../core/l10n/l10n.dart';
import '../../../shared/widgets/empty_state.dart';

/// Meeting timeline and reminders (milestone 5).
class MeetingsScreen extends StatelessWidget {
  const MeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.navMeetings)),
      body: EmptyState(
        icon: Icons.event_note_outlined,
        title: l10n.comingSoonTitle,
        message: l10n.meetingsComingSoon,
      ),
    );
  }
}
