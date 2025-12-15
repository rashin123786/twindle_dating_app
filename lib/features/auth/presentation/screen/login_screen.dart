import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl_mobile_field/intl_mobile_field.dart';
import 'package:twindle_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twindle_app/features/home/presentation/screen/home_screen.dart';

import '../../../../core/theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.gradientBgColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              Text(
                'Welcome to Twindle 💘',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ).animate().fadeIn().slideY(duration: 600.ms),

              const SizedBox(height: 12),

              Text(
                'Swipe. Connect. Love.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ).animate().fadeIn(delay: 300.ms),

              const Spacer(),

              IntlMobileField(
                initialCountryCode: 'IN',
                languageCode: "en",
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(),
                  ),
                ),
                disableLengthCounter: true,
                onCountryChanged: (value) {
                  debugPrint(value.code);
                },
              ).animate().fadeIn(delay: 600.ms),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      indent: 10,
                      endIndent: 10,
                    )),
                    Text("Or"),
                    Expanded(
                        child: Divider(
                      indent: 10,
                      endIndent: 10,
                    )),
                  ],
                ),
              ),

              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoginedState) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthGoogleSignInEvent());
                    },
                    icon: Image.asset(
                      'assets/images/google_signIn.png',
                      height: 24,
                      width: 24,
                    ),
                    label: const Text('Continue with Google'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.black12),
                      ),
                    ),
                  ),
                ),
              ).animate().fadeIn(delay: 800.ms),

              const Spacer(),

              // Terms text
              Text(
                'By continuing, you agree to our Terms & Privacy Policy.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
