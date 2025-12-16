import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/export.dart';

import '../bloc/profile_bloc.dart';

void imagePickBottomsheet(BuildContext context, bool hasImage, int imageIndex) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          2,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<ProfileBloc>().add(UploadPhotoEvent(
                          imageIndex, index == 0 ? true : false));
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.4),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Icon(
                          index == 0 ? Icons.image : Icons.camera_alt_outlined),
                    ),
                  ),
                  Text(index == 0 ? "Gallery" : "Camera")
                ],
              ),
            );
          },
        ),
      ).paddingOnly(bottom: MediaQuery.of(context).viewPadding.bottom + 10);
    },
  );
}
