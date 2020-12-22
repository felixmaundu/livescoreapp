import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

//injection class is always this way 

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
configureDependencies(String environment) => $initGetIt(getIt,environment: environment);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
