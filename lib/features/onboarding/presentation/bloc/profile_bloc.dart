import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twindle_app/features/onboarding/domain/entity/profile_entity.dart';
import 'package:twindle_app/features/onboarding/domain/usecases/profile_usecases.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUsecases profileUsecases;
  final List<ImageEntity> _images = [];
  ProfileBloc(this.profileUsecases) : super(ProfileInitial()) {
    on<UploadPhotoEvent>(_uploadPhoto);
  }

  Future<void> _uploadPhoto(
    UploadPhotoEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final result = await profileUsecases.uploadPhoto(
        event.isGallery ? ImageSource.gallery : ImageSource.camera);

    if (result == null) {
      emit(PhotoFailureState());
      return;
    }

    /// Replace image if index already exists
    if (event.index < _images.length) {
      _images[event.index] = result;
    }

    /// Add image if index is next empty slot
    else if (event.index == _images.length && _images.length < 6) {
      _images.add(result);
    }

    emit(
      PhotoUploadedSuccessState(
        List<ImageEntity>.from(_images), // immutable copy
      ),
    );
  }
}
