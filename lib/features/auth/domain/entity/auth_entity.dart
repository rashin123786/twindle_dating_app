class UserEntity {
  final String uid;
  final String name;
  final String email;
  final String profile;
  UserEntity(this.name,
      {required this.uid, required this.email, required this.profile});
}
