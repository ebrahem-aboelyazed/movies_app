// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/favorites/services/favorites_storage.dart' as _i7;
import '../../modules/movies/movies.dart' as _i11;
import '../../modules/movies/services/movies_service_impl.dart' as _i12;
import '../../modules/watch_list/services/watch_list_storage.dart' as _i8;
import '../../routes/app_pages.dart' as _i5;
import '../api/base/base_api_impl.dart' as _i10;
import '../api/local/hive_manager.dart' as _i4;
import '../api/local/settings_storage.dart' as _i6;
import '../core.dart' as _i9;
import 'register_module.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Dio>(() => registerModule.dio);
    gh.singleton<_i4.HiveManager>(() => _i4.HiveManager());
    gh.singleton<_i5.AppPages>(() => _i5.AppPages());
    gh.lazySingleton<_i6.SettingsStorage>(() => _i6.SettingsStorage());
    gh.lazySingleton<_i7.FavoritesStorage>(() => _i7.FavoritesStorage());
    gh.lazySingleton<_i8.WatchListStorage>(() => _i8.WatchListStorage());
    await gh.singletonAsync<_i9.BaseApi>(
      () {
        final i = _i10.BaseApiImpl(gh<_i3.Dio>());
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i11.MoviesService>(
        () => _i12.MoviesServiceImpl(gh<_i9.BaseApi>()));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
