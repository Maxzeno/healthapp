import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pixel_dat_test_app/app/screens/log_in_screen.dart';
import 'package:pixel_dat_test_app/models/daily_metrics.dart';
import 'package:pixel_dat_test_app/models/user_model.dart';
import 'package:pixel_dat_test_app/src/snackbar.dart';
import 'package:pixel_dat_test_app/src/utils/constants.dart';
import 'package:pixel_dat_test_app/src/utils/helper.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find<UserController>();

  var isLoading = true.obs;
  var user = UserModel.fromJson(null).obs;
  var dailyStat = DailyMetrics.fromJson(null).obs;

  var isLoadingSubmit = false.obs;
  var isLoadingDailyStats = false.obs;

  Future submit(
      {required GlobalKey<FormState> formKey,
      required String steps,
      required String calorieConsumption,
      required String waterIntake}) async {
    isLoadingSubmit.value = true;
    update();

    var url = "$baseURL/daily-stats";

    DateTime now = DateTime.now();

    // Format the date as yyyy-MM-dd
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    final body = jsonEncode({
      'steps': int.parse(steps.isEmpty ? '0' : steps),
      'calorieConsumption':
          double.parse(calorieConsumption.isEmpty ? '0' : calorieConsumption),
      'waterIntake': double.parse(waterIntake.isEmpty ? '0' : waterIntake),
      'date': formattedDate,
    });

    String? token = getToken();
    if (token == null) {
      Get.off(
        () => const LoginScreen(),
        routeName: 'LoginScreen',
        duration: const Duration(milliseconds: 300),
        fullscreenDialog: true,
        curve: Curves.easeIn,
        popGesture: true,
        transition: Transition.rightToLeft,
      );
      isLoadingDailyStats.value = false;
      update();
      return;
    }

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token",
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 201) {
        successSnackbar("Submitted successfully");
        formKey.currentState!.reset();
        getLastDailyStat();
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
    isLoadingSubmit.value = false;
    update();
  }

  Future getLastDailyStat() async {
    isLoadingDailyStats.value = true;
    update();

    var url = "$baseURL/daily-stats";
    String? token = getToken();
    if (token == null) {
      Get.off(
        () => const LoginScreen(),
        routeName: 'LoginScreen',
        duration: const Duration(milliseconds: 300),
        fullscreenDialog: true,
        curve: Curves.easeIn,
        popGesture: true,
        transition: Transition.rightToLeft,
      );
      isLoadingDailyStats.value = false;
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
        final dynamic josndata = jsonDecode(response.body);
        if ((josndata as List).isEmpty) {
          return;
        }
        dailyStat.value = DailyMetrics.fromJson(josndata[0]);
      } else if (response.statusCode == 401) {
        failedSnackbar(jsonDecode(response.body)['error']);
        removeToken();
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
    isLoadingDailyStats.value = false;
    update();
  }

  Future getUser() async {
    isLoading.value = true;
    update();

    var url = "$baseURL/auth-user";
    String? token = getToken();
    if (token == null) {
      Get.off(
        () => const LoginScreen(),
        routeName: 'LoginScreen',
        duration: const Duration(milliseconds: 300),
        fullscreenDialog: true,
        curve: Curves.easeIn,
        popGesture: true,
        transition: Transition.rightToLeft,
      );
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
        user.value = modelUser(response.body);
      } else if (response.statusCode == 401) {
        failedSnackbar(jsonDecode(response.body)['error']);
        removeToken();
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
