import 'package:flutter/material.dart';

import '../../../core/l10n/l10n.dart';
import '../../../shared/widgets/empty_state.dart';

/// Family tree, relationship finder and family groups (milestones 3–4).
class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.navFamily)),
      body: EmptyState(
        icon: Icons.account_tree_outlined,
        title: l10n.comingSoonTitle,
        message: l10n.familyComingSoon,
      ),
    );
  }
}
