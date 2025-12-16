part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class UploadPhotoEvent extends ProfileEvent {
  final int index;
  final bool isGallery;
  UploadPhotoEvent(this.index, this.isGallery);
}
