import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pixel_dat_test_app/app/screens/log_in_screen.dart';
import 'package:pixel_dat_test_app/app/screens/sign_up_screen.dart';
import 'package:pixel_dat_test_app/controller/auth_controller.dart';
import 'package:pixel_dat_test_app/src/app_filled_button.dart';
import 'package:pixel_dat_test_app/src/strings.dart';
import 'package:pixel_dat_test_app/src/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    AuthController.instance.checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              height: h,
              width: w,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: w,
                        height: h * 0.3,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                AssetImage("assets/onboarding_screen_logo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // Text("Do all the transactions",
                      //     style: Theme.of(context).textTheme.headline2!.copyWith(
                      //           color: Colors.black,
                      //         )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("STAY FIT",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: Colors.black,
                              )),
                      const SizedBox(
                        height: 10,
                      ),
                      // Text("Enex",
                      //     style: Theme.of(context).textTheme.headline1!.copyWith(
                      //           color: Colors.black,
                      //         )),
                      const SizedBox(
                        height: 50,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AppFilledButton(
                              buttonText: kLogin,
                              height: 50,
                              onPressed: () => Get.off(
                                () => const LoginScreen(),
                                routeName: 'LoginScreen',
                                duration: const Duration(milliseconds: 300),
                                fullscreenDialog: true,
                                curve: Curves.easeIn,
                                popGesture: true,
                                transition: Transition.rightToLeft,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: AppFilledButton(
                              buttonText: kRegister,
                              buttonColor: appColors.white,
                              textColor: appColors.purple,
                              height: 50,
                              isOutlined: true,
                              onPressed: () {
                                Get.off(
                                  () => const SignUpScreen(),
                                  routeName: 'SignUpScreen',
                                  duration: const Duration(milliseconds: 300),
                                  fullscreenDialog: true,
                                  curve: Curves.easeIn,
                                  popGesture: true,
                                  transition: Transition.rightToLeft,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ]),
                  )),
            )));
  }
}
