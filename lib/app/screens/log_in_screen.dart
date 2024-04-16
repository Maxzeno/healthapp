import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_dat_test_app/app/screens/sign_up_screen.dart';
import 'package:pixel_dat_test_app/controller/auth_controller.dart';
import 'package:pixel_dat_test_app/controller/login.dart';
import 'package:pixel_dat_test_app/src/app_filled_button.dart';
import 'package:pixel_dat_test_app/src/app_text_button.dart';
import 'package:pixel_dat_test_app/src/app_text_field.dart';
import 'package:pixel_dat_test_app/src/strings.dart';
import 'package:pixel_dat_test_app/src/theme.dart';
import 'package:pixel_dat_test_app/src/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    AuthController.instance.checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      height: h,
      width: w,
      child: GetBuilder<LoginController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: appColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),

                  //
                  Text(
                    'Securely login to your pixel account',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: appColors.grey,
                    ),
                  ),

                  const SizedBox(
                    height: 42,
                  ),

                  // Form field

                  ListView(
                    shrinkWrap: true,
                    children: [
                      AppTextField(
                          title: 'Email address',
                          labelText: 'Email address',
                          textInputAction: TextInputAction.next,
                          controller: _emailController,
                          validator: Validator.nonEmptyField),
                      const SizedBox(height: 24),
                      AppTextField(
                        title: 'Password',
                        labelText: 'Password',
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        controller: _passwordController,
                        validator: Validator.password,
                      ),

                      const SizedBox(height: 56),

                      // Proceed button
                      AppFilledButton(
                        loading: controller.isLoading.value,
                        buttonText: kProceed,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            controller.login(
                                password: _passwordController.text.trim(),
                                email: _emailController.text.trim());
                          }
                        },
                      ),

                      const SizedBox(height: 30),

                      // Sign up button
                      Center(
                        child: AppRichTextButton(
                          highLightedText: kRegister,
                          text: kDontHaveAcct,
                          onTap: () => Get.off(
                            () => const SignUpScreen(),
                            routeName: 'SignUpScreen',
                            duration: const Duration(milliseconds: 300),
                            fullscreenDialog: true,
                            curve: Curves.easeIn,
                            popGesture: true,
                            transition: Transition.rightToLeft,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }
}

  // void logUserIn() async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim(),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text("No user found for that email."),
  //         ),
  //       );
  //     } else if (e.code == 'wrong-password') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text("Wrong password provided for that user."),
  //         ),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text("$e"),
  //         ),
  //       );
  //     }
  //   }
  //   if (context.mounted) {
  //     Navigator.pop(context);
  //   }
  // }
