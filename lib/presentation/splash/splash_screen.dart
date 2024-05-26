import 'package:flutter/material.dart';
import 'package:hiero_job_seeker/core/colors/colors.dart';
import 'package:hiero_job_seeker/core/constants/constants.dart';
import 'package:hiero_job_seeker/presentation/splash/fun_splash.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashtime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorApp,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/animations/CDrnH9tHIY.json'),
          const Text(
            'HIERO',
            style: TextStyle(
                fontSize: 30, color: colorWhite, fontWeight: FontWeight.bold),
          ),
          sizedBox25H,
          LottieBuilder.asset('assets/animations/veZrHhKqH3.json')
        ],
      ),
    );
  }
}
