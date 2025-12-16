import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twindle_app/core/constants/app_text_style.dart';
import 'package:twindle_app/core/theme/app_theme.dart';
import 'package:twindle_app/features/onboarding/presentation/bloc/profile_bloc.dart';
import 'package:twindle_app/features/onboarding/presentation/widgets/image_upload_bottomsheet.dart';

import '../../domain/entity/profile_entity.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Add your best photos",
                  style: AppTextStyles.heading,
                ),
                subtitle: RichText(
                  text: TextSpan(
                    text:
                        "Upload a few photos that show who you are. Smiles work best 😉",
                    style: AppTextStyles.subTitle,
                    children: [
                      TextSpan(
                        text:
                            "\nMake sure you add at least 2 photos to continue",
                        style: AppTextStyles.subTitle.copyWith(
                          color: Colors.red,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  List<ImageEntity> images = [];

                  if (state is PhotoUploadedSuccessState) {
                    images = state.imageEntity ?? [];
                  }

                  return Wrap(
                    spacing: 8,
                    runSpacing: 16,
                    children: List.generate(6, (index) {
                      final hasImage = index < images.length;
                      final canTap = index <= images.length;

                      return Container(
                        width: 70,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 0.4),
                        ),
                        child: canTap
                            ? InkWell(
                                onTap: () {
                                  imagePickBottomsheet(
                                      context, hasImage, index);

                                  // context
                                  //     .read<ProfileBloc>()
                                  //     .add(UploadPhotoEvent(index));
                                },
                                child: hasImage
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          File(images[index].path),
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const Icon(Icons.add),
                              )
                            : const SizedBox(),
                      );
                    }),
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          int count = 0;

          if (state is PhotoUploadedSuccessState) {
            count = state.imageEntity?.length ?? 0;
          }

          return ElevatedButton(
            onPressed: count >= 2
                ? () {
                    // Navigate to next onboarding screen
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              foregroundColor: AppColors.backgroundLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Next",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ).paddingOnly(
            bottom: MediaQuery.of(context).viewPadding.bottom + 10,
            left: 16,
            right: 16,
          );
        },
      ),
    );
  }
}
