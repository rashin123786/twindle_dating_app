import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twindle_app/core/theme/app_theme.dart';
import 'package:twindle_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twindle_app/features/auth/presentation/screen/login_screen.dart';
import 'package:twindle_app/features/home/presentation/screen/home_screen.dart';
import 'package:twindle_app/features/onboarding/presentation/screens/upload_photo_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginedState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          }
          if (state is AuthLogoutState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          }
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration:
                  const BoxDecoration(gradient: AppColors.gradientBgColor),
            ),

            Positioned(
              top: -60,
              left: -60,
              child: Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(213, 255, 193, 204), // soft blue tone
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Bottom-Right Half Circle
            Positioned(
              bottom: -60,
              right: -60,
              child: Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(213, 178, 235, 242), // soft blue tone
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Main Splash Content
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/girl3.jpg',
                        width: 140,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                          .animate()
                          .slideX(begin: 1.0, end: 0.0, duration: 800.ms)
                          .fadeIn(duration: 800.ms),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Twindle",
                            style: GoogleFonts.poppins(
                                color: AppColors.primary,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(
                          "Swipe. Connect. Love.",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(duration: 1200.ms)
                        .slideY(begin: -0.5, end: 0.0),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/boy.jpg',
                        width: 140,
                        height: 220,
                        fit: BoxFit.cover,
                      )
                          .animate()
                          .slideX(begin: -1.0, end: 0.0, duration: 800.ms)
                          .fadeIn(duration: 800.ms),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
