import 'package:image_picker/image_picker.dart';
import 'package:twindle_app/features/onboarding/domain/entity/profile_entity.dart';

abstract class ProfileRepo {
  Future<ImageEntity?> pickImage(ImageSource imageSource);
}
