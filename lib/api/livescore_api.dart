import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:http/io_client.dart' as http;
import 'package:livescoreapp/utils/constants.dart';

//insert this for code generation
part 'livescore_api.chopper.dart';

//lazySingleton here is for the service locator
@lazySingleton

//this is how to use chopper service
@ChopperApi(baseUrl: "/")
abstract class LivescoreApi extends ChopperService {

  //factoryMethod is for service locator
  @factoryMethod

  //how you create a chopper client
  static LivescoreApi create() {
    final client = ChopperClient(
        baseUrl: BASE_URL,
        services: [_$LivescoreApi()],
        converter: JsonConverter(),
        errorConverter: JsonConverter(),
        client: http.IOClient(
            HttpClient()..connectionTimeout = const Duration(seconds: 60)),
        interceptors: [
          HeadersInterceptor({'Accept': 'application/json'}),
          HttpLoggingInterceptor(),
        ]);
    return _$LivescoreApi(client);
  }

  //all ar GET request, I suppose you know http calls,ie get,post put, delete etc...
  @Get(path: 'scores/live.json')
  Future<Response> getLiveMatches(
    @Query("key") String key,
    @Query("secret") String secret,
  );

  //luke at the url how it is written

  //BASE_URL                              baseUrl("/")  path:                     @Query params key           @Query params secret
  //"http://livescore-api.com/api-client.... |.. /.. |..scores/history.json..|?|..key=xqepXxGyNEr8XkFC..|&|..secret=YnVXO51Y251gKMNid1HbznJn2avZvaBt";
  @Get(path: 'scores/history.json')
  Future<Response> getHistoryMatches(
    @Query("key") String key,
    @Query("secret") String secret,
  );

  @Get(path: 'fixtures/matches.json')
  Future<Response> getFixture(
    @Query("key") String key,
    @Query("secret") String secret,
  );
}