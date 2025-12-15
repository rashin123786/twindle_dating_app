part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoginedState extends AuthState {}

final class AuthLogoutState extends AuthState {}
