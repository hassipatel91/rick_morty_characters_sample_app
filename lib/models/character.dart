import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  Character({this.id, this.name, this.image, this.status, this.species});

  int? id;
  String? name;
  String? image;
  String? status;
  String? species;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharactorFromJson(json);

  Map<String, dynamic> toJson() => _$CharactorToJson(this);
}
