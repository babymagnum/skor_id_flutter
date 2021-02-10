import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pln_flutter/utils/theme/theme_color.dart';
import 'package:pln_flutter/utils/theme/theme_text_style.dart';
import 'package:pln_flutter/utils/widgets/button_loading.dart';
import 'package:pln_flutter/view/base_view.dart';
import 'package:pln_flutter/view/login/login_controller.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  var _loginCt = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Column(
        children: [
          Container(
            color: GetPlatform.isAndroid ? Colors.black : Colors.transparent, height: MediaQuery.of(context).padding.top,
            width: Get.width,
          ),
          Expanded(
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Obx(() => Column(
                      children: [
                        SizedBox(height: 40.h,),
                        ButtonLoading(
                          backgroundColor: ThemeColor.primary,
                          disable: false,
                          title: 'Sign In',
                          loading: false,
                          onTap: () => _loginCt.login(),
                          verticalPadding: 14.h,
                          textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
