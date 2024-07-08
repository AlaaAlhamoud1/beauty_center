import 'package:beauty_center/application/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'package:beauty_center/application/authentication/widgets/text_field_widget.dart';
import 'package:beauty_center/application/dashboard/screens/dashboard_screen.dart';
import 'package:beauty_center/core/utils/common.dart';
import 'package:beauty_center/core/utils/extensions/widget_extensions.dart';
import 'package:beauty_center/core/values/constant.dart';
import 'package:beauty_center/core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';

TextEditingController mobileController = TextEditingController();

TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isLoading != null && state.isLoading == true) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
            }
            if (state.user != null) {
              const DashboardScreen().launch(context,
                  pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: Image.asset(ImagePath.logoImage)),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          welcome,
                          style: TextStyle(
                              color: AppColors.darkGreyColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          loginUsingEmail,
                          style: TextStyle(
                              color: AppColors.darkGreyColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
                CustomTextFieldWidget(
                    labelText: "Mobile",
                    controller: mobileController,
                    hintText: 'Enter Your number'),
                const Spacer(),
                CustomTextFieldWidget(
                    labelText: "password",
                    controller: passwordController,
                    hintText: "Enter Your password"),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password ?',
                      style: TextStyle(color: AppColors.darkGreyColor),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                MaterialButton(
                  onPressed: () {
                    const DashboardScreen().launch(context,
                        pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
                    // BlocProvider.of<AuthBloc>(context).add(
                    //   LogInEvent(
                    //     phoneNumber: mobileController.text.trim(),
                    //     password: passwordController.text.trim(),
                    //   ),
                    // );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.blueColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 100),
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Guest',
                    style: TextStyle(
                        color: AppColors.lightGoldColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.lightGoldColor),
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
