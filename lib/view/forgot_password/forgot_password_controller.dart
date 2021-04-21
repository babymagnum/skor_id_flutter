import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/utils/helper/text_util.dart';

import '../../main.dart';

class ForgotPasswordController extends GetxController{
  var loading = false.obs;
  var email = ''.obs;
  var autoValidate = false.obs;
  GlobalKey<FormState> formKey = GlobalKey();
  
  emailOnChange(String value) => email.value = value;

  String? emailValidate(String? value){
    if(!TextUtil.validateEmail(value!))
      return 'Masukkan email dengan format benar';
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
  
  forgot(){
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
    Future.delayed(Duration(seconds: 3), (){
      loading.value = false;
      Get.snackbar('Success', 'Email has been sent to your inbox', 
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(16),
        colorText: Colors.black,
        backgroundColor: Colors.white
      );
    });
  }
}