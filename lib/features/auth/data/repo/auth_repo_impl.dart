import 'package:google_sign_in/google_sign_in.dart';
import 'package:twindle_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:twindle_app/features/auth/data/models/user_model.dart';
import 'package:twindle_app/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthDomainRepo {
  final AuthDatasource authDatasource;
  AuthRepoImpl(this.authDatasource);
  @override
  Future sentOtp() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signInWithGoole() {
    return authDatasource.signInWithGooleDataSource();
  }

  @override
  Future verifyOtp() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signOut() {
    return authDatasource.signOut();
  }

  @override
  Future<UserModel?> getCurrentUser() {
    return authDatasource.getCurrentUser();
  }
}
