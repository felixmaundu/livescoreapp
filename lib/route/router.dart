import 'package:auto_route/auto_route_annotations.dart';
import 'package:livescoreapp/details//live_detail.dart';

import '../main.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: SoccerApp, initial: true),
    MaterialRoute(page: LiveDetailPage),//, ..config),
  ],
)

class $Router { 


}