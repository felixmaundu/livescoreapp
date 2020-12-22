import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:livescoreapp/new_models/fixtures_model.dart';
import 'package:livescoreapp/new_models/match_model.dart';
import 'package:livescoreapp/new_models/past_match_model.dart';
import 'package:livescoreapp/repository/livescore_repository.dart';

part 'livescore_event.dart';
part 'livescore_state.dart';

@injectable
class LivescoreBloc extends Bloc<LivescoreEvent, LivescoreState> {
  LivescoreBloc({@required this.repository}) : super(LivescoreInitial());

  // we usually dont call repository here...we use classes called usecases
  //these usecases help in debug mode...
  final LivescoreRepository repository;

  @override
  Stream<LivescoreState> mapEventToState(
    LivescoreEvent event,
  ) async* {
    if (event is GetMatchesEvent) {
      yield Loading();
      final liveEither = await repository.getLive();
      final pastEither = await repository.getPastMatches();
      final fixturesEither = await repository.getFixtures();

      //ok nimezinest but should be easy to understand

      //fold is method of dart that when folds either<left,Righr> method..remember in repository
      yield* liveEither.fold(
        (failure) async* {
          //fold left failure
          yield Error(message: failure);
        },
        (live) async* {
          //fold right success, then yield second method
          yield* pastEither.fold(
            (failure) async* {
              yield Error(message: failure);
            },
            (past) async* {
              yield* fixturesEither.fold(
                (failure) async* {
                  yield Error(message: failure);
                },
                (fixtures) async* {
                  //after nesting on success, now all fold right, then it yields success
                  yield Success(live: live, past: past, fixtures: fixtures);
                },
              );
            },
          );
        },
      );
    }
  }
}
