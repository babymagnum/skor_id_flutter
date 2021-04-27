import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/utils/theme/theme_color.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';
import 'package:skor_id_flutter/utils/widgets/button_loading.dart';
import 'package:skor_id_flutter/view/base_view.dart';
import 'package:skor_id_flutter/view/forgot_password/forgot_password_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _forgotPassCt = ForgotPasswordController();
    return BaseView(
      isUseAppbar: true,
      appbarTitle: 'Forgot Password',
      child: Obx(() => SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: _forgotPassCt.formKey,
          autovalidateMode: _forgotPassCt.autoValidate.value ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Column(
            children: [
              Container(
                child: Text('Silahkan masukkan email anda yang terdaftar untuk menerima email reset password'.tr, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 16), textAlign: TextAlign.center),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: TextFormField(
                  onChanged: _forgotPassCt.emailOnChange,
                  validator: _forgotPassCt.emailValidate,
                  keyboardType: TextInputType.emailAddress,
                  controller: TextEditingController()..text = Get.parameters['email'].toString(),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(12, 18, 12, 18),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    hintText: 'Masukkan email anda',
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.7)), borderRadius: BorderRadius.all(Radius.circular(8))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.7)), borderRadius: BorderRadius.all(Radius.circular(8))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.7)), borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 24),
                child: ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _forgotPassCt.loading.value,
                  title: 'Kirim',
                  loading: _forgotPassCt.loading.value,
                  onTap: () => _forgotPassCt.forgot(),
                  textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.sp),
                  buttonPadding: EdgeInsets.fromLTRB(11.w, 10.h, 11.w, 10.h),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}