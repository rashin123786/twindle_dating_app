import 'dart:io';

import 'package:image_picker_platform_interface/src/types/image_source.dart';
import 'package:twindle_app/features/onboarding/data/datasources/profile_datasource.dart';
import 'package:twindle_app/features/onboarding/domain/entity/profile_entity.dart';
import 'package:twindle_app/features/onboarding/domain/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDatasource profileDatasource;
  ProfileRepoImpl(this.profileDatasource);
  @override
  Future<ImageEntity?> pickImage(ImageSource imageSource) async {
    File? file;
    if (imageSource == ImageSource.gallery) {
      file = await profileDatasource.pickImageFromGallery();
    } else {
      file = await profileDatasource.pickImageFromCamera();
    }
    if (file != null) {
      return ImageEntity(path: file.path, name: file.uri.pathSegments.last);
    }

    return null;
  }
}
