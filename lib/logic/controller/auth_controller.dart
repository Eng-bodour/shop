import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop/routes/routes.dart';

class AuthController extends GetxController {
  late bool isVisibility = false;
  late bool isCheckedBox = false;
  var displayUserName = '';
  var displayUserPhoto = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkedBox() {
    isCheckedBox = !isCheckedBox;
    update();
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      //replaceAll('-', ' '); to show message without sign {-} betwin word
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = ' provided password is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 10),
          snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 10),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logInUsingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = auth.currentUser!.displayName!;
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String message = '';
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      if (error.code == 'user-not-found') {
        message =
            'Account does not exists for that $email ... create your account by signing up...';
      } else if (error.code == 'wrong-password') {
        message = 'Invalid password .... Please try aqain';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String message = '';
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      if (error.code == 'user-not-found') {
        message =
            'Account does not exists for that $email ... create your account by signing up...';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 10),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void facebookSignUpApp() {}

  void signOutFromApp() {}
}
