// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/details/details_bloc.dart' as _i7;
import '../../../application/home/home_bloc.dart' as _i8;
import '../../../infrastructure/details/details_repository.dart' as _i4;
import '../../../infrastructure/home/home_repository.dart' as _i6;
import '../../details/i_details_repo.dart' as _i3;
import '../../home/i_home_repo.dart' as _i5;

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
    gh.lazySingleton<_i3.IDetailsRepo>(() => _i4.DetailsRepository());
    gh.lazySingleton<_i5.IHomeRepo>(() => _i6.HomeRepository());
    gh.factory<_i7.DetailsBloc>(() => _i7.DetailsBloc(gh<_i3.IDetailsRepo>()));
    gh.factory<_i8.HomeBloc>(() => _i8.HomeBloc(gh<_i5.IHomeRepo>()));
    return this;
  }
}
