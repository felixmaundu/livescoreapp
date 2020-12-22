// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livescore_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$LivescoreApi extends LivescoreApi {
  _$LivescoreApi([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = LivescoreApi;

  @override
  Future<Response<dynamic>> getLiveMatches(String key, String secret) {
    final $url = '/scores/live.json';
    final $params = <String, dynamic>{'key': key, 'secret': secret};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHistoryMatches(String key, String secret) {
    final $url = '/scores/history.json';
    final $params = <String, dynamic>{'key': key, 'secret': secret};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getFixture(String key, String secret) {
    final $url = '/fixtures/matches.json';
    final $params = <String, dynamic>{'key': key, 'secret': secret};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
