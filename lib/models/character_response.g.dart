// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactorResponse _$CharactorResponseFromJson(Map<String, dynamic> json) =>
    CharactorResponse(
      charactors: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactorResponseToJson(CharactorResponse instance) =>
    <String, dynamic>{
      'results': instance.charactors,
    };
