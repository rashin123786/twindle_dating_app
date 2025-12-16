import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twindle_app/core/services_locator.dart';
import 'package:twindle_app/core/theme/app_theme.dart';

import 'package:twindle_app/features/auth/presentation/auth_controller.dart';
import 'package:twindle_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twindle_app/features/auth/presentation/screen/splash_screen.dart';
import 'package:twindle_app/features/onboarding/presentation/bloc/profile_bloc.dart';
import 'package:twindle_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://lkwxmnhlspepkvakkknk.supabase.co',
    anonKey: 'sb_publishable_3_Ug9PRWqAqRpITcerTybA_miUz6nvx',
    accessToken: () async {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      return token;
    },
  );
  await setupLocator();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..add(AuthCheckAuthEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileBloc>(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          home: SplashScreen()),
    );
  }
}
