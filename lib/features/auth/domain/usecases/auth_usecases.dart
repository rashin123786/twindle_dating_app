import 'package:twindle_app/features/auth/domain/entity/auth_entity.dart';
import 'package:twindle_app/features/auth/domain/repo/auth_repo.dart';

class AuthUsecases {
  final AuthDomainRepo authDomainRepo;
  AuthUsecases(this.authDomainRepo);

  Future<UserEntity> signInWithGoogleUsecases() async {
    return await authDomainRepo.signInWithGoole();
  }

  Future<UserEntity> signOutUSecase() async {
    return await authDomainRepo.signOut();
  }

  Future<UserEntity?> checkAuthStatusUsecase() async {
    return await authDomainRepo.getCurrentUser();
  }
}
