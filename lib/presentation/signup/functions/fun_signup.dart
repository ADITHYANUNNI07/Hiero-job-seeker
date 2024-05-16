import 'package:flutter/material.dart';
import 'package:hiero_job_seeker/infrastructure/firebase/firebase_auth.dart';
import 'package:hiero_job_seeker/infrastructure/models/usermodels.dart';
import 'package:hiero_job_seeker/presentation/signup/signup_screen.dart';

signupFun(GlobalKey<FormState> signupformKey) {
  if (signupformKey.currentState!.validate()) {
    UserModel userModel = UserModel(
        name:
            '${firstNameEditingController.text} ${secondNameEditingController.text}',
        email: emailEditingController.text,
        password: passwordEditingController.text,
        phoneNo: phoneNoEditingController.text,
        address: addressEditingController.text,
        dob: dateEditingConntroller.text,
        gender: genderEditingController.text,
        bio: bioEditingController.text);
    AuthServiceClass().createUserAccount(userModel);
  }
}
