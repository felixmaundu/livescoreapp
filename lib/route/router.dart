import 'package:auto_route/auto_route_annotations.dart';
import 'package:livescoreapp/tabs/tab1.dart';
import 'package:livescoreapp/details//live_detail.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: Tab1Page, initial: true),
    MaterialRoute(page: LiveDetailPage),//, ..config),
  ],
)

class $Router { 


}