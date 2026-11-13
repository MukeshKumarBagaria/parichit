import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/backup/presentation/backup_screen.dart';
import '../../features/duplicates/presentation/duplicates_screen.dart';
import '../../features/family/presentation/family_screen.dart';
import '../../features/family_tree/presentation/family_tree_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/interactions/presentation/log_meeting_screen.dart';
import '../../features/meetings/presentation/meetings_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/people/presentation/screens/edit_person_screen.dart';
import '../../features/people/presentation/screens/people_screen.dart';
import '../../features/people/presentation/screens/person_detail_screen.dart';
import '../../features/people/presentation/screens/quick_add_screen.dart';
import '../../features/relationships/presentation/relation_finder_screen.dart';
import '../../features/settings/presentation/more_screen.dart';
import '../../features/settings/presentation/settings_providers.dart';
import '../../features/settings/presentation/trash_screen.dart';
import '../../features/sync/presentation/sync_screen.dart';
import 'app_shell.dart';
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// App navigation. A [StatefulShellRoute] keeps each bottom tab's own stack
/// (and scroll position) alive while switching tabs. Full-screen flows use
/// the root navigator so they cover the bottom bar.
final appRouterProvider = Provider<GoRouter>((ref) {
  // Re-run redirects when onboarding completes, without rebuilding the router.
  final onboardingDone = ValueNotifier<bool>(ref.read(appSettingsProvider).onboardingComplete);
  ref
    ..listen(appSettingsProvider.select((s) => s.onboardingComplete), (_, next) => onboardingDone.value = next)
    ..onDispose(onboardingDone.dispose);

  GoRoute fullScreen(String path, Widget Function(GoRouterState s) build, {bool dialog = false}) => GoRoute(
    path: path,
    parentNavigatorKey: _rootNavigatorKey,
    pageBuilder: (context, state) => MaterialPage(key: state.pageKey, fullscreenDialog: dialog, child: build(state)),
  );

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.home,
    refreshListenable: onboardingDone,
    redirect: (context, state) {
      final atOnboarding = state.matchedLocation == Routes.onboarding;
      if (!onboardingDone.value) return atOnboarding ? null : Routes.onboarding;
      if (atOnboarding) return Routes.home;
      return null;
    },
    routes: [
      GoRoute(path: Routes.onboarding, builder: (context, state) => const OnboardingScreen()),
      fullScreen(Routes.addPerson, (_) => const QuickAddScreen(), dialog: true),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: Routes.home, builder: (context, state) => const HomeScreen())],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.people,
                builder: (context, state) => const PeopleScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (context, state) => PersonDetailScreen(personId: state.pathParameters['id']!),
                    routes: [
                      fullScreen('edit', (s) => EditPersonScreen(personId: s.pathParameters['id']!), dialog: true),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.family,
                builder: (context, state) => const FamilyScreen(),
                routes: [
                  GoRoute(
                    path: 'tree',
                    builder: (context, state) => FamilyTreeScreen(focusId: state.uri.queryParameters['focus']),
                  ),
                  GoRoute(
                    path: 'finder',
                    builder: (context, state) => RelationFinderScreen(
                      initialA: state.uri.queryParameters['a'],
                      initialB: state.uri.queryParameters['b'],
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.meetings,
                builder: (context, state) => const MeetingsScreen(),
                routes: [
                  fullScreen(
                    'new',
                    (s) => LogMeetingScreen(initialPersonId: s.uri.queryParameters['person']),
                    dialog: true,
                  ),
                  fullScreen(':id', (s) => LogMeetingScreen(interactionId: s.pathParameters['id'])),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.more,
                builder: (context, state) => const MoreScreen(),
                routes: [
                  GoRoute(path: 'trash', builder: (context, state) => const TrashScreen()),
                  GoRoute(path: 'duplicates', builder: (context, state) => const DuplicatesScreen()),
                  GoRoute(path: 'backup', builder: (context, state) => const BackupScreen()),
                  GoRoute(path: 'sync', builder: (context, state) => const SyncScreen()),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
