import 'package:twindle_app/features/auth/domain/entity/auth_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required String uid,
      required String name,
      required String email,
      required String profile})
      : super(name, uid: uid, email: email, profile: profile);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      profile: json['profile'] as String ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profile': profile,
    };
  }
}
