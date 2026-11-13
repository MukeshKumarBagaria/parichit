import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/family/presentation/family_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/meetings/presentation/meetings_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/people/presentation/screens/people_screen.dart';
import '../../features/people/presentation/screens/person_detail_screen.dart';
import '../../features/people/presentation/screens/quick_add_screen.dart';
import '../../features/settings/presentation/more_screen.dart';
import '../../features/settings/presentation/settings_providers.dart';
import 'app_shell.dart';
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// App navigation. A [StatefulShellRoute] keeps each bottom tab's own stack
/// (and scroll position) alive while switching tabs.
final appRouterProvider = Provider<GoRouter>((ref) {
  // Re-run redirects when onboarding completes, without rebuilding the router.
  final onboardingDone = ValueNotifier<bool>(ref.read(appSettingsProvider).onboardingComplete);
  ref
    ..listen(appSettingsProvider.select((s) => s.onboardingComplete), (_, next) => onboardingDone.value = next)
    ..onDispose(onboardingDone.dispose);

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
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: Routes.addPerson,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          fullscreenDialog: true,
          child: QuickAddScreen(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: Routes.home, builder: (context, state) => const HomeScreen()),
            ],
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
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: Routes.family, builder: (context, state) => const FamilyScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: Routes.meetings, builder: (context, state) => const MeetingsScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: Routes.more, builder: (context, state) => const MoreScreen()),
            ],
          ),
        ],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
