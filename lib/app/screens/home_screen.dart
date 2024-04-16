import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_dat_test_app/app/screens/log_in_screen.dart';
import 'package:pixel_dat_test_app/controller/user.dart';
import 'package:pixel_dat_test_app/src/utils/colour_config.dart';
import 'package:pixel_dat_test_app/src/utils/helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    // required this.h,
    // required this.w,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _steps = TextEditingController();
  final TextEditingController _waterIntake = TextEditingController();
  final TextEditingController _calorieConsumption = TextEditingController();

  @override
  void initState() {
    super.initState();
    UserController.instance.getUser();
    UserController.instance.getLastDailyStat();
  }

  @override
  void dispose() {
    _steps.dispose();
    _waterIntake.dispose();
    _calorieConsumption.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GetBuilder<UserController>(builder: (controller) {
      if (controller.isLoading.value) {
        return Container(
          width: w,
          height: h,
          color: Colors.grey.shade300,
          child: Center(
            child: CircularProgressIndicator(
              color: ColourConfig.redColour,
            ),
          ),
        );
      }
      return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
            toolbarHeight: 75,
            backgroundColor: Colors.green,
            title: SizedBox(
              width: w,
              child: Text("Hi, ${controller.user.value.name.split(' ')[0]}",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.black,
                      )),
            ),
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.account_circle_rounded,
                size: 60,
              ),
            ),
            leadingWidth: 100,
            actions: [
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        removeToken();
                        Get.to(
                          () => const LoginScreen(),
                          routeName: 'LoginScreen',
                          duration: const Duration(milliseconds: 300),
                          fullscreenDialog: true,
                          curve: Curves.easeIn,
                          popGesture: true,
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: const Icon(
                        Icons.logout,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
        body: SizedBox(
            height: h,
            width: w,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      Text("HEALTH TRACKER",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: Colors.black,
                              )),
                      const SizedBox(
                        height: 25,
                      ),
                      controller.isLoadingDailyStats.value
                          ? const SizedBox()
                          : Column(
                              children: [
                                Text(
                                    'Steps: ${controller.dailyStat.value.steps}'),
                                Text(
                                    'Water Intake: ${controller.dailyStat.value.waterIntake} ml'),
                                Text(
                                    'Calorie Consumption: ${controller.dailyStat.value.calorieConsumption} kcal'),
                              ],
                            ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => InputMetricsPage()),
                      //     );
                      //   },
                      //   child: Text('Input Metrics'),
                      // ),
                      const SizedBox(
                        height: 25,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _steps,
                              decoration:
                                  const InputDecoration(labelText: 'Steps'),
                              keyboardType: TextInputType.number,
                              onSaved: (value) {},
                            ),
                            TextFormField(
                              controller: _waterIntake,
                              decoration: const InputDecoration(
                                  labelText: 'Water Intake (ml)'),
                              keyboardType: TextInputType.number,
                              onSaved: (value) {},
                            ),
                            TextFormField(
                              controller: _calorieConsumption,
                              decoration: const InputDecoration(
                                  labelText: 'Calorie Consumption (kcal)'),
                              keyboardType: TextInputType.number,
                              onSaved: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: controller.isLoadingSubmit.value
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        controller.submit(
                                            formKey: _formKey,
                                            steps: _steps.text,
                                            calorieConsumption:
                                                _calorieConsumption.text,
                                            waterIntake: _waterIntake.text);
                                      }
                                    },
                              child: controller.isLoadingSubmit.value
                                  ? const Text("Loading...")
                                  : const Text('Submit'),
                            ),
                          ],
                        ),
                      ),
                    ])))),
      );
    });
  }
}
