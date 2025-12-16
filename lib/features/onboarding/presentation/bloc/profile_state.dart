part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class PhotoUploadedSuccessState extends ProfileState {
  final List<ImageEntity>? imageEntity;
  PhotoUploadedSuccessState(this.imageEntity);
}

final class PhotoFailureState extends ProfileState {}
