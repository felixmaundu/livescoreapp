import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:livescoreapp/api/livescore_api.dart';
import 'package:livescoreapp/errors/exceptions.dart';
import 'package:livescoreapp/new_models/fixtures_model.dart';
import 'package:livescoreapp/new_models/match_model.dart';
import 'package:livescoreapp/new_models/past_match_model.dart';

//allways use abstract class,interfaces to do stuff
abstract class LivescoreRemoteDataSource {
  Future<List<MatchModel>> getLive(String key, String secret);
  Future<List<PastMatchModel>> getPastMatches(String key, String secret);
  Future<List<FixturesModel>> getFixtures(String key, String secret);
}

//this is how you inject abstract classes
@LazySingleton(as: LivescoreRemoteDataSource)
class LivescoreRemoteDataSourceImp implements LivescoreRemoteDataSource {
  final LivescoreApi api;

  LivescoreRemoteDataSourceImp({@required this.api});

  @override
  Future<List<MatchModel>> getLive(key, secret) async {
    try {
      final response = await api.getLiveMatches(key, secret);
      if (response.statusCode == 200) {
        List<MatchModel> matches = [];
        try {
          matches = (response.body["data"]["match"] as List)
              .map((e) => MatchModel.fromJson(e))
              .toList();
        } catch (e) {
          print(e.toString());
        }

        return matches;
      } else if (response.statusCode == 401) {
        throw UnAuthenticatedException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<List<PastMatchModel>> getPastMatches(key, secret) async {
    try {
      final response = await api.getHistoryMatches(key, secret);
      if (response.statusCode == 200) {
        List<PastMatchModel> matches = [];
        try {
          matches = (response.body["data"]["match"] as List)
              .map((e) => PastMatchModel.fromJson(e))
              .toList();
        } catch (e) {
          print(e.toString());
        }

        return matches;
      } else if (response.statusCode == 401) {
        throw UnAuthenticatedException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<List<FixturesModel>> getFixtures(key, secret) async {
    try {
      final response = await api.getFixture(key, secret);
      if (response.statusCode == 200) {
        List<FixturesModel> matches = [];
        try {
          matches = (response.body["data"]["fixtures"] as List) //this is how the response body is named..check json format of response
              .map((e) => FixturesModel.fromJson(e))
              .toList();
        } catch (e) {
          print(e.toString());
        }

        return matches;
      } else if (response.statusCode == 401) {
        throw UnAuthenticatedException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }
}
