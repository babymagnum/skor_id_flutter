import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skor_id_flutter/main.dart';
import 'package:skor_id_flutter/utils/helper/constant.dart';
import 'package:skor_id_flutter/utils/helper/text_util.dart';
import 'package:skor_id_flutter/view/main/main_view.dart';

class LoginController extends GetxController {
  var obsecure = true.obs;
  var loading = false.obs;
  var email = ''.obs;
  var password = ''.obs;
  var autoValidate = false.obs;
  GlobalKey<FormState> formKey = GlobalKey();

  setObsecure(bool value) => obsecure.value = value;

  emailOnChange(String value) => email.value = value;

  passwordOnChange(String value) => password.value = value;

  String? emailValidate(String? value){
    if(!TextUtil.validateEmail(value!))
      return 'Masukkan email dengan format benar';
    else
      return null;
  }

  String? passwordValidate(String? value){
    if(value!.length < 4)
      return 'Masukkan password minimal 4 karater';
    else
      return null;
  }

  bool validateInput(){
    if(formKey.currentState!.validate()){
      return true;
    }else{
      autoValidate.value = true;
      return false;
    }
  }

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
    try {
      final GoogleSignInAccount googleSignInAccount = await (googleSignIn.signIn() as FutureOr<GoogleSignInAccount>);
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await auth.signInWithCredential(credential);
      User? user = auth.currentUser;
      
      if(user != null){
        print('User ${user.email}, ${user.displayName}');
        commonController.preferences!.setBool(Constant.IS_LOGIN, true);
        Get.off(() => MainView());
      }
    } catch (e) {
      Get.snackbar('Sorry', 'Please login with email instead', 
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(16),
        colorText: Colors.black,
        backgroundColor: Colors.white
      );
    }
  }

  signOutWithGoogle() async {
    await googleSignIn.signOut();
  }

  login() async {
    if(!validateInput()){
      return;
    }

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
    Get.off(() => MainView());
  }
}