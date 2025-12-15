import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twindle_app/features/auth/data/models/user_model.dart';

abstract class AuthDatasource {
  Future<UserModel> signInWithGooleDataSource();
  Future<UserModel> signOut();
  Future<UserModel?> getCurrentUser();
  Future sentOtp();
  Future verifyOtp();
}

class AuthDataSourceImpl implements AuthDatasource {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future sentOtp() {
    // TODO: implement sentOtp
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final isSigned = await _googleSignIn.isSignedIn();
    if (isSigned) {
      final user = _googleSignIn.currentUser;
      return UserModel(
        profile: user?.photoUrl ?? "",
        uid: user?.id ?? "",
        name: user?.displayName ?? "",
        email: user?.email ?? "",
      );
    }

    return null;
  }

  @override
  Future<UserModel> signInWithGooleDataSource() async {
    final data = await _googleSignIn.signIn();
    if (data != null) {
      final userData = UserModel(
          profile: data.displayName ?? '',
          uid: data.id,
          name: data.displayName ?? 'User${data.id}',
          email: data.email);
      return userData;
    }
    throw UnimplementedError();
  }

  @override
  Future verifyOtp() {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signOut() async {
    final data = await _googleSignIn.signOut();

    if (data != null) {
      final userData = UserModel(
          profile: data.photoUrl ?? "",
          uid: data.id,
          name: data.displayName ?? 'User${data.id}',
          email: data.email);
      return userData;
    }

    throw UnimplementedError();
  }
}
