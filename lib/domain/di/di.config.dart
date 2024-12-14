// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repos/auth_repo/data_sources/log_in_data_source_impl.dart'
    as _i103;
import '../../data/repos/auth_repo/log_in_repo_impl.dart' as _i954;
import '../../ui/screens/auth/log_in/logic/log_in_view_model.dart' as _i802;
import '../repos/log_in_repo.dart' as _i933;
import '../use_cases/log_in_use_case.dart' as _i650;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i895.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i103.LogInDataSourceImpl>(() => _i103.LogInDataSourceImpl());
    gh.factory<_i933.LogInRepo>(() => _i954.LogInRepoImpl(
          gh<_i103.LogInDataSourceImpl>(),
          gh<_i895.Connectivity>(),
        ));
    gh.factory<_i650.LoginUseCase>(
        () => _i650.LoginUseCase(gh<_i933.LogInRepo>()));
    gh.factory<_i802.LoginViewModel>(
        () => _i802.LoginViewModel(gh<_i650.LoginUseCase>()));
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
