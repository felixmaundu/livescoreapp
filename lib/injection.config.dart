// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'api/livescore_api.dart';
import 'bloc/livescore_bloc.dart';
import 'data_source/livescore_remote_data_source.dart';
import 'repository/livescore_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<LivescoreApi>(() => LivescoreApi.create());
  gh.lazySingleton<LivescoreRemoteDataSource>(
      () => LivescoreRemoteDataSourceImp(api: get<LivescoreApi>()));
  gh.lazySingleton<LivescoreRepository>(() => LivescoreRepositoryImp(
      remoteDataSource: get<LivescoreRemoteDataSource>()));
  gh.factory<LivescoreBloc>(
      () => LivescoreBloc(repository: get<LivescoreRepository>()));
  return get;
}
