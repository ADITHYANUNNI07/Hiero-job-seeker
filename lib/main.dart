import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiero_job_seeker/application/auth/auth_provider.dart';
import 'package:hiero_job_seeker/core/colors/colors.dart';
import 'package:hiero_job_seeker/core/provider/provider.dart';
import 'package:hiero_job_seeker/infrastructure/helper/sharedpreference.dart';
import 'package:hiero_job_seeker/presentation/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'domain/di/injectable.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpProviderModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => GenderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JobFilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthRepositoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SharedPreferenceClass(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: customPrimaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          primaryColor: const Color(0xFF390D72),
          iconTheme: const IconThemeData(color: Color(0xFF390D72)),
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            buttonColor: Color(0xFF390D72),
          ),
          textTheme: GoogleFonts.poppinsTextTheme().apply(),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
