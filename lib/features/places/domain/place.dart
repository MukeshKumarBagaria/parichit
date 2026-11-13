import 'package:meta/meta.dart';

@immutable
final class Place {
  const Place({required this.id, required this.name, this.nameAlt, this.type = 'village', this.parentId});

  final String id;
  final String name;
  final String? nameAlt;

  /// village | town | city | tehsil | district | state | country | other
  final String type;
  final String? parentId;

  String get displayName => nameAlt == null ? name : '$name · $nameAlt';

  @override
  bool operator ==(Object other) => other is Place && other.id == id && other.name == name && other.nameAlt == nameAlt;

  @override
  int get hashCode => Object.hash(id, name, nameAlt);
}
