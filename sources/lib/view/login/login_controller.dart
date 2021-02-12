import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pln_flutter/main.dart';
import 'package:pln_flutter/utils/helper/text_util.dart';

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

  String emailValidate(String value){
    if(!TextUtil.validateEmail(value))
      return 'Masukkan email dengan format benar';
    else
      return null;
  }

  String passwordValidate(String value){
    if(value.length < 4)
      return 'Masukkan password minimal 4 karater';
    else
      return null;
  }

  bool validateInput(){
    if(formKey.currentState.validate()){
      return true;
    }else{
      autoValidate.value = true;
      return false;
    }
  }

  loginWithGoogle(){
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

    // commonController.preferences.setBool(Constant.IS_LOGIN, true);
    // Get.off(HomeView());
  }
}