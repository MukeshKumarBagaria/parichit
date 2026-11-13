/// Every route path in one place — never hard-code paths in widgets.
abstract final class Routes {
  static const onboarding = '/onboarding';

  // Bottom-navigation tabs
  static const home = '/home';
  static const people = '/people';
  static const family = '/family';
  static const meetings = '/meetings';
  static const more = '/more';

  // Full-screen flows
  static const addPerson = '/add-person';
  static const signIn = '/sign-in';
  static const syncIssues = '/sync-issues';

  static String person(String id) => '/people/$id';
}
