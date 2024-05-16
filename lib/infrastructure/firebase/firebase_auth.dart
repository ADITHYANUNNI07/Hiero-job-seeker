import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hiero_job_seeker/infrastructure/models/usermodels.dart';

String verificationID = '';

class AuthServiceClass {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//login
  Future loginUserAccount(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      // ignore: unnecessary_null_comparison
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

//signUp
  Future createUserAccount(UserModel userModel) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: userModel.email, password: userModel.password))
          .user!;
      // ignore: unnecessary_null_comparison
      if (user != null) {
        print('truecccccccc');
        //call our database service to update the user data
        // await DatabaseService(uid: user.uid)
        //     .savingUserData(fullname, email, phone, adKey);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  // final GetxSnackBarControllerClass controller =
  //  Get.put(GetxSnackBarControllerClass());

  //final SharedpreferenceClass sharedController =
  //   Get.put(SharedpreferenceClass());

  Future phoneNumberAuth(String phoneNumber) async {
    // loginScrnGetxController.isLoadingFN(isLoad: true);
    firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (phoneAuthCredential) async {
        await firebaseAuth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // loginScrnGetxController.isLoadingFN(isLoad: false);
        // controller.showSnackBar(
        //     title: 'Phone Number Signin Failed',
        //     content: e.toString(),
        //     errorcolor: colorRed);
      },
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
