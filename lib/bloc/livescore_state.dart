part of 'livescore_bloc.dart';

abstract class LivescoreState extends Equatable {
  const LivescoreState();

  @override
  List<Object> get props => [];
}

class LivescoreInitial extends LivescoreState {}
class Loading extends LivescoreState{}

class Error extends LivescoreState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}

//initialize all models here to get request at a go
class Success extends LivescoreState {
  final List<MatchModel> live;
  final List<PastMatchModel> past;
  final List<FixturesModel> fixtures;

  Success({
    @required this.live,
    @required this.past,
    @required this.fixtures,
  });

  //equatable, value equality
  @override
  List<Object> get props => [live, past, fixtures];
}
