// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:ganesh_chanda/core/DI/firebase_module.dart' as _i723;
import 'package:ganesh_chanda/core/services/email_service.dart' as _i307;
import 'package:ganesh_chanda/features/auth/data/datasource/auth_remote_data_source.dart'
    as _i428;
import 'package:ganesh_chanda/features/auth/data/repository_impl/auth_repository_impl.dart'
    as _i299;
import 'package:ganesh_chanda/features/auth/domain/repository/auth_repository.dart'
    as _i444;
import 'package:ganesh_chanda/features/auth/presentation/bloc/auth_bloc.dart'
    as _i831;
import 'package:ganesh_chanda/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart'
    as _i983;
import 'package:ganesh_chanda/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i804;
import 'package:ganesh_chanda/features/auth/presentation/bloc/sign_up_volunteer/sign_up_volunteer_bloc.dart'
    as _i687;
import 'package:ganesh_chanda/features/community/data/datasource/community_remote_data_source.dart'
    as _i900;
import 'package:ganesh_chanda/features/community/data/repository_impl/community_repository_impl.dart'
    as _i131;
import 'package:ganesh_chanda/features/community/domain/repository/community_repository.dart'
    as _i836;
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart'
    as _i661;
import 'package:ganesh_chanda/features/donation/data/datasource/donation_remote_data_source.dart'
    as _i681;
import 'package:ganesh_chanda/features/donation/data/repository_impl/donation_repository_impl.dart'
    as _i721;
import 'package:ganesh_chanda/features/donation/domain/repository/donation_repository.dart'
    as _i1052;
import 'package:ganesh_chanda/features/donation/presentation/bloc/donation_bloc.dart'
    as _i974;
import 'package:ganesh_chanda/features/expense/data/datasource/expense_remote_data_source.dart'
    as _i13;
import 'package:ganesh_chanda/features/expense/data/repository_impl/expense_repository_impl.dart'
    as _i126;
import 'package:ganesh_chanda/features/expense/domain/repository/expense_repository.dart'
    as _i79;
import 'package:ganesh_chanda/features/expense/presentation/bloc/expense_bloc.dart'
    as _i673;
import 'package:ganesh_chanda/features/festival/data/datasource/festival_remote_data_source.dart'
    as _i820;
import 'package:ganesh_chanda/features/festival/data/repository_impl/festival_repository_impl.dart'
    as _i954;
import 'package:ganesh_chanda/features/festival/domain/repository/festival_repository.dart'
    as _i984;
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart'
    as _i867;
import 'package:ganesh_chanda/features/volunteer/data/datasource/volunteer_remote_data_source.dart'
    as _i254;
import 'package:ganesh_chanda/features/volunteer/data/datasource/volunteer_remote_data_source_impl.dart'
    as _i195;
import 'package:ganesh_chanda/features/volunteer/data/repository_impl/volunteer_repository_impl.dart'
    as _i3;
import 'package:ganesh_chanda/features/volunteer/domain/repository/volunteer_repository.dart'
    as _i71;
import 'package:ganesh_chanda/features/volunteer/presentation/bloc/volunteer_bloc.dart'
    as _i820;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseModule.firebaseFirestore,
    );
    gh.lazySingleton<_i307.EmailService>(() => _i307.EmailService());
    gh.lazySingleton<_i681.DonationRemoteDataSource>(
      () => _i681.DonationRemoteDataSourceImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.lazySingleton<_i900.CommunityRemoteDataSource>(
      () => _i900.CommunityRemoteDataSourceImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.lazySingleton<_i428.AuthRemoteDataSource>(
      () => _i428.FirebaseAuthDataSourceImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i13.ExpenseRemoteDataSource>(
      () => _i13.ExpenseRemoteDataSourceImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.lazySingleton<_i254.VolunteerRemoteDataSource>(
      () => _i195.VolunteerRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i71.VolunteerRepository>(
      () => _i3.VolunteerRepositoryImpl(gh<_i254.VolunteerRemoteDataSource>()),
    );
    gh.lazySingleton<_i820.FestivalRemoteDataSource>(
      () => _i820.FestivalRemoteDataSourceImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.lazySingleton<_i1052.DonationRepository>(
      () => _i721.DonationRepositoryImpl(gh<_i681.DonationRemoteDataSource>()),
    );
    gh.lazySingleton<_i444.AuthRepository>(
      () => _i299.AuthRepositoryImpl(gh<_i428.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i836.CommunityRepository>(
      () =>
          _i131.CommunityRepositoryImpl(gh<_i900.CommunityRemoteDataSource>()),
    );
    gh.factory<_i820.VolunteerBloc>(
      () => _i820.VolunteerBloc(
        gh<_i71.VolunteerRepository>(),
        gh<_i307.EmailService>(),
      ),
    );
    gh.factory<_i974.DonationBloc>(
      () => _i974.DonationBloc(gh<_i1052.DonationRepository>()),
    );
    gh.lazySingleton<_i79.ExpenseRepository>(
      () => _i126.ExpenseRepositoryImpl(gh<_i13.ExpenseRemoteDataSource>()),
    );
    gh.lazySingleton<_i984.FestivalRepository>(
      () => _i954.FestivalRepositoryImpl(gh<_i820.FestivalRemoteDataSource>()),
    );
    gh.factory<_i661.CommunityBloc>(
      () => _i661.CommunityBloc(gh<_i836.CommunityRepository>()),
    );
    gh.factory<_i831.AuthBloc>(
      () => _i831.AuthBloc(gh<_i444.AuthRepository>()),
    );
    gh.factory<_i983.SignInBloc>(
      () => _i983.SignInBloc(gh<_i444.AuthRepository>()),
    );
    gh.factory<_i804.SignUpBloc>(
      () => _i804.SignUpBloc(gh<_i444.AuthRepository>()),
    );
    gh.factory<_i687.SignUpVolunteerBloc>(
      () => _i687.SignUpVolunteerBloc(gh<_i444.AuthRepository>()),
    );
    gh.factory<_i867.FestivalBloc>(
      () => _i867.FestivalBloc(gh<_i984.FestivalRepository>()),
    );
    gh.factory<_i673.ExpenseBloc>(
      () => _i673.ExpenseBloc(gh<_i79.ExpenseRepository>()),
    );
    return this;
  }
}

class _$FirebaseModule extends _i723.FirebaseModule {}
