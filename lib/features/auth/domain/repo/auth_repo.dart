import 'package:twindle_app/features/auth/data/models/user_model.dart';
import 'package:twindle_app/features/auth/domain/entity/auth_entity.dart';

abstract class AuthDomainRepo {
  Future<UserEntity> signInWithGoole();
  Future<UserEntity> signOut();
  Future<UserModel?> getCurrentUser();
  Future sentOtp();
  Future verifyOtp();
}
