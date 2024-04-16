import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pixel_dat_test_app/app/screens/log_in_screen.dart';
import 'package:pixel_dat_test_app/src/snackbar.dart';
import 'package:pixel_dat_test_app/src/utils/constants.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find<SignupController>();

  var isLoading = false.obs;
  var isPWSuccess = false.obs;
  var hidePassword = true.obs;

  void setHidePassword() {
    hidePassword.value = !hidePassword.value;
    update();
  }

  void setPWSuccess(bool value) {
    isPWSuccess.value = value;
    update();
  }

  Future signup(
      {required String name,
      required String password,
      required String email}) async {
    isLoading.value = true;
    update();

    var url = "$baseURL/signup";

    final body = jsonEncode({
      'name': name.trim(),
      'password': password.trim(),
      'email': email.trim(),
    });

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 201) {
        hidePassword.value = true;
        successSnackbar("Signup successful please login");
        Get.off(
          () => const LoginScreen(),
          routeName: 'LoginScreen',
          duration: const Duration(milliseconds: 300),
          fullscreenDialog: true,
          curve: Curves.easeIn,
          popGesture: true,
          transition: Transition.rightToLeft,
        );
      } else {
        failedSnackbar(jsonDecode(response.body)['error']);
      }
    } catch (e) {
      if (e is TimeoutException) {
        failedSnackbar("Please check your internet");
      } else {
        failedSnackbar("Something went wrong");
      }
    }
    isLoading.value = false;
    update();
  }
}
