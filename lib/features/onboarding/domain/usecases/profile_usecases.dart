import 'package:image_picker/image_picker.dart';
import 'package:twindle_app/features/onboarding/domain/entity/profile_entity.dart';
import 'package:twindle_app/features/onboarding/domain/repo/profile_repo.dart';

class ProfileUsecases {
  final ProfileRepo repo;
  ProfileUsecases(this.repo);

  Future<ImageEntity?> uploadPhoto(ImageSource imageSource) async {
    return await repo.pickImage(imageSource);
  }
}
