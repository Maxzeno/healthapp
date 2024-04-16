import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_dat_test_app/app/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Get.off(
        () => const OnboardingScreen(),
        routeName: 'OnboardingScreen',
        duration: const Duration(milliseconds: 300),
        fullscreenDialog: true,
        curve: Curves.easeIn,
        popGesture: true,
        transition: Transition.rightToLeft,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              image: AssetImage('assets/splash_screen_logo.jpg'),
              width: 354,
              height: 354,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Text(
              'HealthTrack',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
