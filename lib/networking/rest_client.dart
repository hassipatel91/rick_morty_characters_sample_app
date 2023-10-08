import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_morty_characters_sample_app/models/character_response.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api/character')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('character')
  Future<CharactorResponse> getCharacter(@Query('page') int page);
}
