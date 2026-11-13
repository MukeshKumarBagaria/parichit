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
  static const trash = '/more/trash';
  static const duplicates = '/more/duplicates';
  static const backup = '/more/backup';
  static const sync = '/more/sync';

  static String person(String id) => '/people/$id';
  static String editPerson(String id) => '/people/$id/edit';
  static String tree({String? focus}) => focus == null ? '/family/tree' : '/family/tree?focus=$focus';
  static String finder({String? a, String? b}) {
    final q = [if (a != null) 'a=$a', if (b != null) 'b=$b'].join('&');
    return q.isEmpty ? '/family/finder' : '/family/finder?$q';
  }

  static String logMeeting({String? personId}) => personId == null ? '/meetings/new' : '/meetings/new?person=$personId';
  static String meeting(String id) => '/meetings/$id';
}
