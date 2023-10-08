import 'package:json_annotation/json_annotation.dart';

import 'character.dart';

part 'character_response.g.dart';

@JsonSerializable()
class CharactorResponse {
  CharactorResponse({
    required this.charactors,
  });

  List<Character> charactors;

  factory CharactorResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactorResponseToJson(this);
}
