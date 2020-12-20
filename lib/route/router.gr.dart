// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../Models/live_model.dart';
import '../details/live_detail.dart';
import '../main.dart';

class Routes {
  static const String soccerApp = '/';
  static const String liveDetailPage = '/live-detail-page';
  static const all = <String>{
    soccerApp,
    liveDetailPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.soccerApp, page: SoccerApp),
    RouteDef(Routes.liveDetailPage, page: LiveDetailPage),
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
    LiveDetailPage: (data) {
      final args = data.getArgs<LiveDetailPageArguments>(
        orElse: () => LiveDetailPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LiveDetailPage(
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

  Future<dynamic> pushLiveDetailPage({
    Key key,
    LiveModel live,
  }) =>
      push<dynamic>(
        Routes.liveDetailPage,
        arguments: LiveDetailPageArguments(key: key, live: live),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LiveDetailPage arguments holder class
class LiveDetailPageArguments {
  final Key key;
  final LiveModel live;
  LiveDetailPageArguments({this.key, this.live});
}
