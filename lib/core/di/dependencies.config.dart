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

import '../../modules/movies/movies.dart' as _i7;
import '../../modules/movies/services/movies_service_impl.dart' as _i8;
import '../../routes/app_pages.dart' as _i4;
import '../api/base/base_api_impl.dart' as _i6;
import '../core.dart' as _i5;
import 'register_module.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Dio>(() => registerModule.dio);
    gh.singleton<_i4.AppPages>(() => _i4.AppPages());
    gh.singleton<_i5.BaseApi>(() => _i6.BaseApiImpl(gh<_i3.Dio>())..init());
    gh.lazySingleton<_i7.MoviesService>(
        () => _i8.MoviesServiceImpl(gh<_i5.BaseApi>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
