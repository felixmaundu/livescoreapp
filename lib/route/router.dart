import 'package:auto_route/auto_route_annotations.dart';
import 'package:livescoreapp/pages/details/live_detail.dart';
import 'package:livescoreapp/pages/soccer_app/soccer_app.dart';


@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: SoccerApp, initial: true),
    MaterialRoute(page: LiveDetailsPage), //, ..config),
  ],
)
class $Router {}
