import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pln_flutter/utils/theme/theme_color.dart';
import 'package:pln_flutter/utils/theme/theme_text_style.dart';
import 'package:pln_flutter/utils/widgets/button_loading.dart';
import 'package:pln_flutter/view/base_view.dart';
import 'package:pln_flutter/view/forgot_password/forgot_password_view.dart';
import 'package:pln_flutter/view/login/login_controller.dart';

class LoginView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _loginCt = Get.put(LoginController());

    return BaseView(
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: 'https://c0.anyrgb.com/images/836/953/office-people-business-team-laptop-working-work-human-person-computer.jpg', 
              fit: BoxFit.cover
            )
          ),
          Positioned.fill(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: CachedNetworkImage(
                      imageUrl: 'https://balelabs.id/wp-content/uploads/2020/02/balelabs-logo.png', 
                      fit: BoxFit.contain,
                      width: Get.size.width/1.5,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Expanded(
                  flex: 6,
                  child: ClipRect(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.35), 
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Obx(() {
                          return SingleChildScrollView(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                            child: Form(
                              key: _loginCt.formKey,
                              autovalidateMode: _loginCt.autoValidate.value ? AutovalidateMode.always : AutovalidateMode.disabled,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Login'.tr, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 28, color: Colors.white)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: Text('Email'.tr, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 14, color: Colors.white)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: TextFormField(
                                      onChanged: _loginCt.emailOnChange,
                                      validator: _loginCt.emailValidate,
                                      keyboardType: TextInputType.emailAddress,
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
                                    padding: EdgeInsets.only(top: 14),
                                    child: Text('Password'.tr, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 14, color: Colors.white)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: TextFormField(
                                      onChanged: _loginCt.passwordOnChange,
                                      validator: _loginCt.passwordValidate,
                                      keyboardType: TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      obscureText: _loginCt.obsecure.value,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(12, 18, 12, 18),
                                        filled: true,
                                        fillColor: Colors.white.withOpacity(0.8),
                                        hintText: 'Masukkan password anda',
                                        suffixIcon: IconButton(
                                          icon:  Icon(_loginCt.obsecure.value ? Icons.visibility : Icons.visibility_off, color: Colors.black), 
                                          onPressed: () => _loginCt.setObsecure(!_loginCt.obsecure.value)
                                        ),
                                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.7)), borderRadius: BorderRadius.all(Radius.circular(8))),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.7)), borderRadius: BorderRadius.all(Radius.circular(8))),
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.7)), borderRadius: BorderRadius.all(Radius.circular(8))),
                                      ),
                                    )
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.to(ForgotPasswordView()),
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.only(top: 16),
                                      child: Text('Forget Password ?'.tr, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 14, color: Colors.orange)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: ButtonLoading(
                                      backgroundColor: ThemeColor.primary,
                                      disable: _loginCt.loading.value,
                                      title: 'Masuk',
                                      loading: _loginCt.loading.value,
                                      onTap: () => _loginCt.login(),
                                      verticalPadding: 8.h,
                                      textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(top: 14),
                                    child: GestureDetector(
                                      onTap: _loginCt.loginWithGoogle,
                                      child: Text('Atau masuk dengan Google', style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14, color: Colors.white))
                                    ),
                                  )
                                ],
                              ),
                            ),
                        );
                        })
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
