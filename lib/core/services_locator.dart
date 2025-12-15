import 'package:get_it/get_it.dart';
import 'package:twindle_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:twindle_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:twindle_app/features/auth/domain/repo/auth_repo.dart';
import 'package:twindle_app/features/auth/domain/usecases/auth_usecases.dart';
import 'package:twindle_app/features/auth/presentation/bloc/auth_bloc.dart';

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
}
