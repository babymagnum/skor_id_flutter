import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/main.dart';
import 'package:skor_id_flutter/utils/helper/constant.dart';
import 'package:skor_id_flutter/view/home/home_view.dart';

class LoginController extends GetxController {
  var obsecure = true.obs;
  var loading = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  setObsecure(bool value) => obsecure.value = value;

  emailOnChange(String value) => email.value = value;

  passwordOnChange(String value) => password.value = value;

  loginWithGoogle(){
    if(commonController.notConnected.value){
      Get.snackbar('Sorry', 'Your device not connected to the internet', 
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(16),
        colorText: Colors.black,
        backgroundColor: Colors.white
      );
      return;
    }

    signInWithGoogle();
  }

  signInWithGoogle() async {

  }

  signOutWithGoogle() async {
    await googleSignIn.signOut();
  }

  login() async {
    if(commonController.notConnected.value){
      Get.snackbar('Sorry', 'Your device not connected to the internet', 
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(16),
        colorText: Colors.black,
        backgroundColor: Colors.white
      );
      return;
    }

    loading.value = true;
    await Future.delayed(Duration(seconds: 3), () {});
    loading.value = false;

    commonController.preferences!.setBool(Constant.IS_LOGIN, true);
    Get.offAllNamed(Routes.HOME);
  }
}