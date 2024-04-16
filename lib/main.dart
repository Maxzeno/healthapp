import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_dat_test_app/app/screens/splash_screen.dart';
import 'package:pixel_dat_test_app/controller/auth_controller.dart';
import 'package:pixel_dat_test_app/controller/login.dart';
import 'package:pixel_dat_test_app/controller/signup.dart';
import 'package:pixel_dat_test_app/controller/user.dart';
import 'package:pixel_dat_test_app/src/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  Get.put(UserController());
  Get.put(LoginController());
  Get.put(SignupController());
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: SnackBarController.scaffoldMessengerKey,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        fontFamily: "SF-Pro",
      ),
      // onGenerateRoute: AppRouter.onGenerateRoute,
      // navigatorKey: AppRouter.router.navigatorKey,
      home: const SplashScreen(),
    );
  }
}
