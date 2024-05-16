import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hiero_job_seeker/domain/core/colors/colors.dart';
import 'package:hiero_job_seeker/domain/core/constants/constants.dart';
import 'package:hiero_job_seeker/domain/core/widgets/textfields.dart';
import 'package:hiero_job_seeker/domain/core/widgets/widget.dart';
import 'package:hiero_job_seeker/presentation/dashboard/dashboard_screen.dart';
import 'package:hiero_job_seeker/presentation/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TopColorSafeArea(
      child: SafeArea(
          child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back.', style: mainTitle),
                    const Text('Sign in to continue'),
                    sizedBox25H,
                    TextFieldClass()
                        .buildEmailField(context, emailEditingController),
                    sizedBox10H,
                    TextFieldClass()
                        .buildPasswordField(context, passwordEditingController),
                    sizedBox10H,
                    ElevatedBtnWidget(
                        onPressed: () {
                          Get.to(() => const DashboardScrn());
                        },
                        title: 'LOGIN',
                        btnColor: colorApp),
                    sizedBox15H,
                    const Align(child: Text('OR')),
                    sizedBox15H,
                    ElevatedBtnWidget(
                      onPressed: () {},
                      padding: 10,
                      leading: Image.asset(
                        'assets/images/Google_Icon.png',
                        width: 21,
                      ),
                      title: 'Sign-in with Google',
                      btnColor: colorWhite,
                      titleColor: colorBlack,
                    ),
                    sizedBox10H,
                    ElevatedBtnWidget(
                      onPressed: () {},
                      padding: 10,
                      leading: const FaIcon(
                        FontAwesomeIcons.phone,
                        size: 21,
                        color: colorBlack,
                      ),
                      title: 'Sign-in with Phone',
                      btnColor: colorWhite,
                      titleColor: colorBlack,
                    ),
                    sizedBox20H,
                    Align(
                      child: InkWell(
                        onTap: () {
                          Get.off(() => const SignupScreen());
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Don't have an Account?",
                            children: [
                              TextSpan(
                                text: ' Signup',
                                style: TextStyle(color: colorApp),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
