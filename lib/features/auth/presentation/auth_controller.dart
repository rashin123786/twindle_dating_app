import 'package:get/get.dart';
import 'package:twindle_app/features/auth/domain/entity/auth_entity.dart';

class AuthController extends GetxController {
  final Rxn<UserEntity> _currentUser = Rxn<UserEntity>();

  UserEntity? get currentUser => _currentUser.value;

  void setUser(UserEntity user) {
    _currentUser.value = user;
  }

  void clearUser() {
    _currentUser.value = null;
  }
}
