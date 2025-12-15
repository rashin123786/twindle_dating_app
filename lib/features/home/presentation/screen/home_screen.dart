import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twindle_app/features/auth/presentation/auth_controller.dart';
import 'package:twindle_app/features/auth/presentation/bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> profiles = [
    {
      'name': 'Sophia, 24',
      'image': 'assets/images/girl3.jpg',
    },
    {
      'name': 'Liam, 25',
      'image': 'assets/images/boy.jpg',
    },
    {
      'name': 'Ava, 23',
      'image': 'assets/images/girl2.jpg',
    },
  ];
  final authController = Get.find<AuthController>();
  final cardSwiperController = CardSwiperController();

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<AuthBloc>().add(AuthGoogleSignOutEvent());
                    },
                    child: Text("Twindle ❤️",
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                  ),

                  // Icon(Icons.settings, color: Colors.grey.shade700),
                ],
              ),
            ),

            // Swipe Cards
            Expanded(
              child: CardSwiper(
                controller: cardSwiperController,
                cardsCount: profiles.length,
                numberOfCardsDisplayed: profiles.length,
                allowedSwipeDirection:
                    AllowedSwipeDirection.only(left: true, right: true),
                backCardOffset: const Offset(0, 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                cardBuilder: (context, index, _, __) {
                  final profile = profiles[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          profile['image']!,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Text(
                            profile['name']!,
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 6,
                                  color: Colors.black45,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onSwipe: (previousIndex, currentIndex, direction) {
                  print(previousIndex.toString());
                  return true;
                },
                // onSwipe: _onSwipe(),
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _actionButton(Icons.close, Colors.redAccent),
                  _actionButton(Icons.star, Colors.blueAccent),
                  _actionButton(Icons.favorite, Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: color.withOpacity(0.15),
      child: Icon(icon, size: 28, color: color),
    );
  }
}
