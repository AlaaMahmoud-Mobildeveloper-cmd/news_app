// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api_manager.dart' as _i331;
import 'core/internet_checker.dart' as _i94;
import 'screens/bloc/cubit.dart' as _i712;
import 'screens/reposatry/local/local_repo.dart' as _i302;
import 'screens/reposatry/local/repo_local.dart' as _i950;
import 'screens/reposatry/remot/remote_repo.dart' as _i802;
import 'screens/reposatry/remot/repo.dart' as _i593;
import 'screens/search/bloc/cubit.dart' as _i198;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i94.InternetConnectivity>(() => _i94.InternetConnectivity());
    gh.lazySingleton<_i331.ApiManager>(() => _i331.ApiManager());
    gh.factory<_i950.HomeRepoLocal>(() => _i302.HomeLocalRepoImpl());
    gh.factory<_i593.HomeRepoRemote>(
      () => _i802.HomeRemoteRepoImpl(gh<_i331.ApiManager>()),
    );
    gh.factory<_i712.HomeCubit>(
      () => _i712.HomeCubit(
        gh<_i593.HomeRepoRemote>(),
        gh<_i950.HomeRepoLocal>(),
      ),
    );
    gh.factory<_i198.SearchCubit>(
      () => _i198.SearchCubit(
        gh<_i593.HomeRepoRemote>(),
        gh<_i950.HomeRepoLocal>(),
      ),
    );
    return this;
  }
}
