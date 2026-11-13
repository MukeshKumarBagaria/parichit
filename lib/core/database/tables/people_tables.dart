import 'package:drift/drift.dart';

import 'sync_columns.dart';

@DataClassName('PlaceRow')
class Places extends Table with SyncColumns {
  TextColumn get name => text()();
  TextColumn get nameAlt => text().nullable()();
  TextColumn get placeType => text().withDefault(const Constant('village'))();
  TextColumn get parentPlaceId => text().nullable()();
  TextColumn get pincode => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PersonRow')
@TableIndex(name: 'people_full_name_idx', columns: {#fullName})
@TableIndex(name: 'people_updated_idx', columns: {#updatedAt})
class People extends Table with SyncColumns {
  TextColumn get fullName => text()();
  TextColumn get fullNameAlt => text().nullable()();
  TextColumn get nickname => text().nullable()();
  TextColumn get surname => text().nullable()();
  TextColumn get gender => text().withDefault(const Constant('unknown'))();
  BoolColumn get isLiving => boolean().nullable()();
  IntColumn get birthYear => integer().nullable()();
  IntColumn get birthMonth => integer().nullable()();
  IntColumn get birthDay => integer().nullable()();
  BoolColumn get birthDateApprox => boolean().withDefault(const Constant(false))();
  IntColumn get birthOrder => integer().nullable()();
  IntColumn get deathYear => integer().nullable()();
  IntColumn get deathMonth => integer().nullable()();
  IntColumn get deathDay => integer().nullable()();
  TextColumn get birthPlaceId => text().nullable()();
  TextColumn get nativePlaceId => text().nullable()();
  TextColumn get gotra => text().nullable()();
  TextColumn get occupation => text().nullable()();
  TextColumn get organization => text().nullable()();
  TextColumn get designation => text().nullable()();
  TextColumn get education => text().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isSelf => boolean().withDefault(const Constant(false))();
  BoolColumn get isPlaceholder => boolean().withDefault(const Constant(false))();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  BoolColumn get notifyBirthday => boolean().withDefault(const Constant(true))();
  TextColumn get mergedIntoId => text().nullable()();

  /// Local only: normalised names, aliases, phone digits… used for search.
  TextColumn get searchText => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PersonNameRow')
@TableIndex(name: 'person_names_person_idx', columns: {#personId})
class PersonNames extends Table with SyncColumns {
  TextColumn get personId => text()();
  TextColumn get name => text()();
  TextColumn get nameType => text().withDefault(const Constant('alias'))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PersonContactRow')
@TableIndex(name: 'person_contacts_person_idx', columns: {#personId})
@TableIndex(name: 'person_contacts_value_idx', columns: {#normalizedValue})
class PersonContacts extends Table with SyncColumns {
  TextColumn get personId => text()();

  /// phone | email | website | social | other
  TextColumn get kind => text()();
  TextColumn get value => text()();

  /// E.164 for phones, lowercase for e-mail.
  TextColumn get normalizedValue => text().nullable()();
  TextColumn get label => text().nullable()();
  BoolColumn get isWhatsapp => boolean().withDefault(const Constant(false))();
  BoolColumn get isPrimary => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PersonAddressRow')
@TableIndex(name: 'person_addresses_person_idx', columns: {#personId})
class PersonAddresses extends Table with SyncColumns {
  TextColumn get personId => text()();
  TextColumn get label => text().withDefault(const Constant('home'))();
  TextColumn get addressLine => text().nullable()();
  TextColumn get placeId => text().nullable()();
  TextColumn get pincode => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  BoolColumn get isPrimary => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PersonAttributeRow')
@TableIndex(name: 'person_attributes_person_idx', columns: {#personId})
class PersonAttributes extends Table with SyncColumns {
  TextColumn get personId => text()();
  TextColumn get key => text()();
  TextColumn get value => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
