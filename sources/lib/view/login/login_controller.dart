import 'package:get/get.dart';
import 'package:pln_flutter/utils/helper/constant.dart';
import 'package:pln_flutter/main.dart';
import 'package:pln_flutter/view/home/home_view.dart';

class LoginController extends GetxController {
  var obsecure = true.obs;
  var loading = false.obs;

  setObsecure(bool value) => obsecure.value = value;

  login() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loading.value = false;

    commonController.preferences.setBool(Constant.IS_LOGIN, true);
    Get.off(HomeView());
  }
}