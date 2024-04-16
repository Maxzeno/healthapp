import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pixel_dat_test_app/app/screens/home_screen.dart';
import 'package:pixel_dat_test_app/src/snackbar.dart';
import 'package:pixel_dat_test_app/src/utils/constants.dart';
import 'package:pixel_dat_test_app/src/utils/helper.dart';

class AuthController extends GetxController {
  static AuthController get instance {
    return Get.find<AuthController>();
  }

  var isLoading = false.obs;

  Future checkAuth() async {
    isLoading.value = true;
    update();

    var url = "$baseURL/auth-user";
    String? token = getToken();
    if (token == null) {
      isLoading.value = false;
      update();
      return;
    }

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": 'application/json',
          "Authorization": "Bearer $token",
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        Get.offAll(
          () => const HomeScreen(),
          fullscreenDialog: true,
          curve: Curves.easeIn,
          routeName: "HomeScreen",
          predicate: (route) => false,
          popGesture: false,
          transition: Transition.cupertinoDialog,
        );
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
