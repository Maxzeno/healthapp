import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pixel_dat_test_app/app/screens/home_screen.dart';
import 'package:pixel_dat_test_app/src/snackbar.dart';
import 'package:pixel_dat_test_app/src/utils/constants.dart';
import 'package:pixel_dat_test_app/src/utils/helper.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find<LoginController>();

  var isLoading = false.obs;
  var hidePassword = true.obs;

  void setHidePassword() {
    hidePassword.value = !hidePassword.value;
    update();
  }

  Future login({required String email, required String password}) async {
    isLoading.value = true;
    update();

    var url = "$baseURL/login";

    final body = jsonEncode({
      'email': email.trim(),
      'password': password.trim(),
    });

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        successSnackbar("Login Successful");
        await setToken(jsonDecode(response.body)['token']);
        hidePassword.value = true;

        Get.off(
          () => const HomeScreen(),
          routeName: 'HomeScreen',
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
