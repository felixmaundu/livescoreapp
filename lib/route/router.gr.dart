// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../new_models/match_model.dart';
import '../pages/details/live_detail.dart';
import '../pages/soccer_app/soccer_app.dart';

class Routes {
  static const String soccerApp = '/';
  static const String liveDetailsPage = '/live-details-page';
  static const all = <String>{
    soccerApp,
    liveDetailsPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.soccerApp, page: SoccerApp),
    RouteDef(Routes.liveDetailsPage, page: LiveDetailsPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SoccerApp: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SoccerApp(),
        settings: data,
      );
    },
    LiveDetailsPage: (data) {
      final args = data.getArgs<LiveDetailsPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => LiveDetailsPage(
          key: args.key,
          live: args.live,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSoccerApp() => push<dynamic>(Routes.soccerApp);

  Future<dynamic> pushLiveDetailsPage({
    Key key,
    @required MatchModel live,
  }) =>
      push<dynamic>(
        Routes.liveDetailsPage,
        arguments: LiveDetailsPageArguments(key: key, live: live),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LiveDetailsPage arguments holder class
class LiveDetailsPageArguments {
  final Key key;
  final MatchModel live;
  LiveDetailsPageArguments({this.key, @required this.live});
}
