
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:livescoreapp/route/router.gr.dart' as route;
import 'package:livescoreapp/utils/simple_bloc_observer.dart';
import 'package:logging/logging.dart';

import 'injection.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(Env.dev);
  Bloc.observer = MyBlocObserver();
  //await Firebase.initializeApp();
  _setUpLogging();
  runApp(MyApp());
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name}:${event.time}:${event.message}');
  });
}
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: //Tab1Page(livemodel: liveModels,)
      // SoccerApp()

      builder: ExtendedNavigator<route.Router>(router: route.Router(),),
    );
  }
}


