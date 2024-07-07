// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hiero_job_seeker/application/auth/auth_provider.dart';
import 'package:hiero_job_seeker/core/notification/notification.dart';
import 'package:hiero_job_seeker/core/widgets/textfields.dart';
import 'package:hiero_job_seeker/infrastructure/models/usermodels.dart';
import 'package:hiero_job_seeker/presentation/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

String verificationID = '';

class AuthServiceClass {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future loginUserAccount(UserModel userModel, BuildContext context) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: userModel.email, password: userModel.password))
          .user!;
      if (user != null) {
        AuthRepositoryProvider authRepository =
            Provider.of<AuthRepositoryProvider>(context, listen: false);
        String result = await authRepository.login(userModel);
        if (result == 'success') {
          await NotificationClass()
              .snakBarSuccess('Login Successflly 👋😎', context);
          TextFieldClass().clearAllSignupController();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScrn()),
            (Route<dynamic> route) => false,
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(result)));
        }
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.message ==
          'The supplied auth credential is incorrect, malformed or has expired.') {
        await NotificationClass()
            .snakBarError('E-mail and Password is incorrect 😖', context);
      } else {
        await NotificationClass().snakBarWarning('${e.message} 😖', context);
      }

      return e.message;
    }
  }

  Future createUserAccount(UserModel userModel, BuildContext context) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: userModel.email, password: userModel.password))
          .user!;

      if (user != null) {
        AuthRepositoryProvider authRepository =
            Provider.of<AuthRepositoryProvider>(context, listen: false);
        String result = await authRepository.signup(userModel);
        if (result == 'success') {
          await NotificationClass()
              .snakBarSuccess('Account created 👋😎', context);
          TextFieldClass().clearAllSignupController();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScrn()),
            (Route<dynamic> route) => false,
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(result)));
        }
      }
    } on FirebaseAuthException catch (e) {
      await NotificationClass().snakBarWarning('${e.message}😖', context);
      return;
    }
  }

  Future phoneNumberAuth(String phoneNumber) async {
    firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (phoneAuthCredential) async {
        await firebaseAuth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (verificationId, forceResendingToken) {
        verificationID = verificationId;
        // loginScrnGetxController.isLoadingFN(isLoad: false);
        // loginScrnGetxController.isOTPAllowFN(isOtpvalue: true);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future otpverify(String oTPCode) async {
    // loginScrnGetxController.isLoadingFN(isLoad: true);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: oTPCode);
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        // QuerySnapshot? snapshot =
        //     await DataBaseClass(uid: user.uid).gettingUserData();
        // log('${user.email}::${user.phoneNumber}');
        // if (snapshot == null) {
        //   await DataBaseClass(uid: user.uid).saveUserdata(
        //       phoneNumber: user.phoneNumber!, email: user.email ?? '');
        //   sharedController.saveUserUIDStatus(user.uid);
        //   Get.offAll(() => const DashboardScrn());
        //   loginScrnGetxController.isLoadingFN(isLoad: false);
        // } else {
        //   sharedController.saveUserUIDStatus(user.uid);
        //   loginScrnGetxController.isLoadingFN(isLoad: false);
        //   Get.offAll(() => const DashboardScrn());
        // }
      }
    } catch (e) {
      // loginScrnGetxController.isLoadingFN(isLoad: false);
      // controller.showSnackBar(
      //     title: 'OTP is Incorrect',
      //     content: e.toString(),
      //     errorcolor: colorRed);
    }
  }

  Future signInWithGoogle() async {
    // loginScrnGetxController.isLoadingFN(isLoad: true);
    try {
      final GoogleSignInAccount? guser = await GoogleSignIn().signIn();
      if (guser != null) {
        final GoogleSignInAuthentication gauth = await guser.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: gauth.accessToken, idToken: gauth.idToken);
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        User? user = userCredential.user;
        if (user != null) {
          // QuerySnapshot? snapshot =
          //     await DataBaseClass(uid: user.uid).gettingUserData();
          // if (snapshot == null) {
          //   await DataBaseClass(uid: user.uid).saveUserdata(
          //       email: user.email ?? '', phoneNumber: user.phoneNumber ?? '');
          //   sharedController.saveUserUIDStatus(user.uid);
          //   Get.offAll(() => const DashboardScrn());
          //   loginScrnGetxController.isLoadingFN(isLoad: false);
          // } else {
          //   sharedController.saveUserUIDStatus(user.uid);
          //   Get.offAll(() => const DashboardScrn());
          //   loginScrnGetxController.isLoadingFN(isLoad: false);
          // }
        }
      } else {
        //   loginScrnGetxController.isLoadingFN(isLoad: false);
        return;
      }
    } catch (e) {
      // loginScrnGetxController.isLoadingFN(isLoad: false);
      // controller.showSnackBar(
      //     title: 'Google Sign-in', content: e.toString(), errorcolor: colorRed);
    }
  }
}
