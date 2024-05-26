import 'package:flutter/material.dart';
import 'package:hiero_job_seeker/infrastructure/firebase/firebase_auth.dart';
import 'package:hiero_job_seeker/infrastructure/models/usermodels.dart';
import 'package:hiero_job_seeker/presentation/signup/signup_screen.dart';

signupFun(GlobalKey<FormState> signupformKey, BuildContext context) {
  if (signupformKey.currentState!.validate()) {
    UserModel userModel = UserModel(
      firstName: firstNameEditingController.text.trim(),
      lastName: secondNameEditingController.text.trim(),
      email: emailEditingController.text.trim(),
      password: passwordEditingController.text.trim(),
      phoneNo: phoneNoEditingController.text.trim(),
      address: addressEditingController.text.trim(),
      dob: dateEditingConntroller.text.trim(),
      gender: genderEditingController.text.trim(),
      bio: bioEditingController.text.trim(),
    );
    AuthServiceClass().createUserAccount(userModel, context);
  }
}
