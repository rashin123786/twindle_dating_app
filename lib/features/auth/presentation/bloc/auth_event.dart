part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthCheckAuthEvent extends AuthEvent {}

final class AuthGoogleSignInEvent extends AuthEvent {}

final class AuthGoogleSignOutEvent extends AuthEvent {}
