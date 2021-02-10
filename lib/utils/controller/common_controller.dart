import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pln_flutter/utils/helper/constant.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonController extends GetxController {

  var notConnected = false.obs;
  var language = Constant.INDONESIAN.obs;
  SharedPreferences preferences;

  setNotConnected(value) => notConnected.value = value;

  setLanguage(BuildContext context, String value) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString(Constant.LANGUANGE_CODE, value);
    language.value = value;
    Get.updateLocale(Locale(language.value));
  }

  initValue() async {
    preferences = await SharedPreferences.getInstance();
  }

  loadLanguage(BuildContext context) async {
    final preference = await SharedPreferences.getInstance();
    language.value = preference?.getString(Constant.LANGUANGE_CODE) ?? Constant.INDONESIAN;
    initializeDateFormatting(language.value, null);
    Get.updateLocale(Locale(language.value));
  }
}