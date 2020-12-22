part of 'livescore_bloc.dart';

abstract class LivescoreEvent extends Equatable {
  const LivescoreEvent();

  @override
  List<Object> get props => [];
}

class GetMatchesEvent extends LivescoreEvent {}