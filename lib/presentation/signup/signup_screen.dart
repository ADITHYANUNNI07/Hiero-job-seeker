import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiero_job_seeker/core/colors/colors.dart';
import 'package:hiero_job_seeker/core/constants/constants.dart';
import 'package:hiero_job_seeker/core/provider/provider.dart';
import 'package:hiero_job_seeker/core/widgets/textfields.dart';
import 'package:hiero_job_seeker/core/widgets/widget.dart';
import 'package:hiero_job_seeker/presentation/login/login_screen.dart';
import 'package:hiero_job_seeker/presentation/signup/functions/fun_signup.dart';
import 'package:provider/provider.dart';

final TextEditingController firstNameEditingController =
    TextEditingController();
final TextEditingController secondNameEditingController =
    TextEditingController();
final TextEditingController emailEditingController = TextEditingController();
final TextEditingController passwordEditingController = TextEditingController();
final TextEditingController phoneNoEditingController = TextEditingController();
final TextEditingController addressEditingController = TextEditingController();
final TextEditingController genderEditingController = TextEditingController();
final TextEditingController dateEditingConntroller = TextEditingController();
final TextEditingController bioEditingController = TextEditingController();
final signupformKey = GlobalKey<FormState>();

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TopColorSafeArea(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: SingleChildScrollView(
              child: Form(
                key: signupformKey,
                child: Consumer<SignUpProviderModel>(
                  builder: (context, formPro, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Getting Started', style: mainTitle),
                        const Text('Create an account to continue!'),
                        sizedBox20H,
                        TextFieldClass().buildFirstNameLastNameField(
                            context,
                            firstNameEditingController,
                            secondNameEditingController),
                        TextFieldClass()
                            .buildEmailField(context, emailEditingController),
                        TextFieldClass().buildPasswordField(
                            context, passwordEditingController),
                        TextFieldClass()
                            .buildPhoneField(context, phoneNoEditingController),
                        TextFieldClass().buildAddressField(
                            context, addressEditingController),
                        TextFieldClass()
                            .buildDOBField(context, dateEditingConntroller),
                        TextFieldClass()
                            .buildGenderField(context, genderEditingController),
                        TextFieldClass()
                            .buildBIOField(context, bioEditingController),
                        sizedBox10H,
                        ElevatedBtnWidget(
                          onPressed: () {
                            signupFun(signupformKey, context);
                          },
                          title: 'SIGNUP',
                          btnColor: colorApp,
                        ),
                        sizedBox25H,
                        Align(
                          child: InkWell(
                            onTap: () {
                              Get.off(() => LoginScreen());
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: "Already have an Account?",
                                children: [
                                  TextSpan(
                                    text: ' Login',
                                    style: TextStyle(color: colorApp),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        sizedBox25H
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
