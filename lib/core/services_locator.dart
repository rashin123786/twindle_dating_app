import 'package:get_it/get_it.dart';
import 'package:twindle_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:twindle_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:twindle_app/features/auth/domain/repo/auth_repo.dart';
import 'package:twindle_app/features/auth/domain/usecases/auth_usecases.dart';
import 'package:twindle_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twindle_app/features/onboarding/data/datasources/profile_datasource.dart';
import 'package:twindle_app/features/onboarding/data/repository/profile_repo_impl.dart';
import 'package:twindle_app/features/onboarding/domain/repo/profile_repo.dart';
import 'package:twindle_app/features/onboarding/domain/usecases/profile_usecases.dart';
import 'package:twindle_app/features/onboarding/presentation/bloc/profile_bloc.dart';

final getIt = GetIt.I;
Future<void> setupLocator() async {
  getIt.registerLazySingleton<AuthDatasource>(
    () => AuthDataSourceImpl(),
  );
  getIt.registerLazySingleton<AuthDomainRepo>(
    () => AuthRepoImpl(getIt<AuthDatasource>()),
  );
  getIt.registerLazySingleton(
    () => AuthUsecases(getIt()),
  );
  getIt.registerFactory(
    () => AuthBloc(getIt()),
  );

  ///

  /// 1️⃣ Datasource
  getIt.registerLazySingleton<ProfileDatasource>(
    () => ProfileDatasource(),
  );

  /// 2️⃣ Repository
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      getIt<ProfileDatasource>(),
    ),
  );

  /// 3️⃣ Usecases  ❗ THIS WAS MISSING
  getIt.registerLazySingleton<ProfileUsecases>(
    () => ProfileUsecases(
      getIt<ProfileRepo>(),
    ),
  );

  /// 4️⃣ Bloc
  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      getIt<ProfileUsecases>(),
    ),
  );
}
