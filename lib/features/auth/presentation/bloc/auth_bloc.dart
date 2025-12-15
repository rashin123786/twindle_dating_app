import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:twindle_app/features/auth/domain/usecases/auth_usecases.dart';
import 'package:twindle_app/features/auth/presentation/auth_controller.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecases authUsecases;
  final userController = Get.find<AuthController>();
  AuthBloc(this.authUsecases) : super(AuthInitial()) {
    on<AuthCheckAuthEvent>(_checkAuthState);
    on<AuthGoogleSignInEvent>(_sigInWithGoogle);
    on<AuthGoogleSignOutEvent>(_sigInOut);
  }

  Future _checkAuthState(
      AuthCheckAuthEvent event, Emitter<AuthState> emit) async {
    await Future.delayed(Duration(seconds: 3));
    final user = await authUsecases.checkAuthStatusUsecase();
    if (user != null) {
      userController.setUser(user);
      emit(AuthLoginedState());
    } else {
      emit(AuthLogoutState());
    }
  }

  Future _sigInWithGoogle(
      AuthGoogleSignInEvent event, Emitter<AuthState> emit) async {
    final data = await authUsecases.signInWithGoogleUsecases();
    debugPrint("email===${data.profile}");
    userController.setUser(data);
    emit(AuthLoginedState());
  }

  Future _sigInOut(
      AuthGoogleSignOutEvent event, Emitter<AuthState> emit) async {
    final data = await authUsecases.signOutUSecase();
    debugPrint("email===${data.uid}");
    emit(AuthLogoutState());
  }
}
