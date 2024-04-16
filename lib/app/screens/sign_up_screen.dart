import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_dat_test_app/app/screens/log_in_screen.dart';
import 'package:pixel_dat_test_app/controller/auth_controller.dart';
import 'package:pixel_dat_test_app/controller/signup.dart';
import 'package:pixel_dat_test_app/src/app_filled_button.dart';
import 'package:pixel_dat_test_app/src/app_text_field.dart';
import 'package:pixel_dat_test_app/src/strings.dart';
import 'package:pixel_dat_test_app/src/theme.dart';
import 'package:pixel_dat_test_app/src/validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    AuthController.instance.checkAuth();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final dogBloc = BlocProvider.of<AuthBloc>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<SignupController>(builder: (controller) {
            return Column(
              children: [
                SizedBox(
                  width: w,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 54,
                        ),
                        Text(
                          kCreateAccount,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: appColors.textColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                            'Please fill in the following information so',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                // color: appColors.grey
                                )),
                        const SizedBox(height: 5),
                        const Text(
                          'we can get to know you better',
                          textAlign: TextAlign.center,
                          // style: baseTheme.textTheme.bodyMedium!.copyWith(color: appColors.grey),
                        ),
                        const SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              AppTextField(
                                controller: _firstNameController,
                                title: 'First Name',
                                labelText: 'First Name',
                                validator: Validator.nonEmptyField,
                              ),

                              const SizedBox(height: 24),

                              AppTextField(
                                controller: _lastNameController,
                                title: 'Last Name',
                                labelText: 'Last Name',
                                validator: Validator.nonEmptyField,
                              ),
                              const SizedBox(height: 24),

                              AppTextField(
                                controller: _emailController,
                                title: 'Email Address',
                                labelText: 'Email Address',
                                validator: Validator.emailValidator,
                              ),

                              const SizedBox(height: 24),
                              AppTextField(
                                controller: _passwordController,
                                title: 'Password',
                                isPassword: true,
                                labelText: 'Password',
                                validator: Validator.password,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15, // Specify the width
                                    height: 15,
                                    child: GestureDetector(
                                      onTap: () => Container(
                                        // color: appColors.transparent,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 13.0),
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              // color: appColors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: const Icon(
                                              Icons.check,
                                              // color: appColors.white,
                                              // : appColors.grey,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "I agree to Monthly's ",
                                          style: TextStyle(
                                            // color: appColors.grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Privacy policy ',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              // color: appColors.green,
                                              decoration:
                                                  TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {},
                                        ),
                                        const TextSpan(
                                          text: 'and ',
                                          style: TextStyle(
                                            // color: appColors.grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Terms',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              // color: appColors.green,
                                              decoration:
                                                  TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 42),

                              // submit button
                              AppFilledButton(
                                loading: controller.isLoading.value,
                                buttonText: kCreateAccount,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    String fullName =
                                        '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}';
                                    controller.signup(
                                        name: fullName,
                                        password:
                                            _passwordController.text.trim(),
                                        email: _emailController.text.trim());
                                  }
                                },
                              ),

                              TextButton(
                                onPressed: () => Get.off(
                                  () => const LoginScreen(),
                                  routeName: 'LoginScreen',
                                  duration: const Duration(milliseconds: 300),
                                  fullscreenDialog: true,
                                  curve: Curves.easeIn,
                                  popGesture: true,
                                  transition: Transition.rightToLeft,
                                ),
                                child: const Text(
                                    'Already have an account? $kLogin'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
