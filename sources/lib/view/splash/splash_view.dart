import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pln_flutter/utils/helper/constant.dart';
import 'package:pln_flutter/view/base_view.dart';
import 'package:pln_flutter/view/login/login_view.dart';
import 'package:pln_flutter/view/main/main_view.dart';
import '../../main.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1500), () {
      Get.to((commonController?.preferences?.getBool(Constant.IS_LOGIN) ?? false) ? MainView() : LoginView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Stack(
        children: [
          Image.asset('assets/images/image 66.png', width: Get.width, height: Get.height, fit: BoxFit.fitWidth,),
          Positioned(
            left: 0, right: 0, bottom: 63.h,
            child: Image.asset('assets/images/balelabs_splash.png', width: Get.width * 0.6, height: Get.height * 0.1, fit: BoxFit.contain,),
          )
        ],
      ),
    );
  }
}
