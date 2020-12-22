import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:livescoreapp/data_source/livescore_remote_data_source.dart';
import 'package:livescoreapp/errors/exceptions.dart';
import 'package:livescoreapp/errors/failures.dart';
import 'package:livescoreapp/new_models/fixtures_model.dart';
import 'package:livescoreapp/new_models/match_model.dart';
import 'package:livescoreapp/new_models/past_match_model.dart';
import 'package:livescoreapp/utils/constants.dart';

//always use the repository class to access data..this is where you do most stuff

abstract class LivescoreRepository {

  //either is the dartz, functional programming where is used to control errors and failures
  Future<Either<String, List<MatchModel>>> getLive();
  Future<Either<String, List<PastMatchModel>>> getPastMatches();
  Future<Either<String, List<FixturesModel>>> getFixtures();

  //either is a function when the resource fails.....left string message failure...right, success list of matchmodel
}

@LazySingleton(as: LivescoreRepository)
class LivescoreRepositoryImp implements LivescoreRepository {
  final LivescoreRemoteDataSource remoteDataSource;

  LivescoreRepositoryImp({@required this.remoteDataSource});

  //Failure message checker
  String _returnFailure(final exception) {
    if (exception is ServerException) {
      return SERVER_FAILURE_MESSAGE;
    } else if (exception is CacheException) {
      return CACHE_FAILURE_MESSAGE;
    } else if (exception is UnAuthenticatedException) {
      return UNAUTHENTICATED_FAILURE_MESSAGE;
    } else if (exception is SelectImageException) {
      return SELECT_IMAGE_FAILURE_MESSAGE;
    } else if (exception is SelectImageFromCameraException) {
      return SELECT_FROM_CAMERA_FAILURE_MESSAGE;
    } else if (exception is SelectImageFromGalleryException) {
      return SELECT_FROM_GALLERY_FAILURE_MESSAGE;
    } else if (exception is AccountCreationException) {
      return ACCOUNT_FAILURE_MESSAGE;
    } else if (exception is PermissionException) {
      return PERMISSION_FAILURE_MESSAGE;
    } else if (exception is PermissionNeverAskedException) {
      return PERMISSION_NEVER_ASKED_FAILURE_MESSAGE;
    } else if (exception is NetworkInfoException) {
      return NETWORK_FAILURE_MESSAGE;
    } else if (exception is ServerMaintainException) {
      return SERVER_MAINTAINCE_FAILURE_MESSAGE;
    } else if (exception is SocketException) {
      return SOCKET_FAILURE_MESSAGE;
    } else {
      return SERVER_FAILURE_MESSAGE;
    }
  }

  @override
  Future<Either<String, List<FixturesModel>>> getFixtures() async {
    try {
      final fixtures = await remoteDataSource.getFixtures(KEY, SECRET);
      return Right(fixtures);
    } catch (e) {
      print(e.toString());
      final failure = _returnFailure(e);
      return Left(failure);
    }
  }

  @override
  Future<Either<String, List<MatchModel>>> getLive() async {
    try {
      final live = await remoteDataSource.getLive(KEY, SECRET);
      return Right(live);
    } catch (e) {
      print(e.toString());
      final failure = _returnFailure(e);

      //retuns left which is string...and right is now list model
      return Left(failure);
    }
  }

  @override
  Future<Either<String, List<PastMatchModel>>> getPastMatches() async {
    try {
      final past = await remoteDataSource.getPastMatches(KEY, SECRET);
      return Right(past);
    } catch (e) {
      print(e.toString());
      final failure = _returnFailure(e);
      return Left(failure);
    }
  }
}
