import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/utils/helper/constant.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';
import 'package:skor_id_flutter/utils/widgets/button_loading.dart';
import 'package:skor_id_flutter/view/base_view.dart';
import 'package:skor_id_flutter/view/login/login_controller.dart';

class LoginView extends StatelessWidget {

  var _loginCt = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {

    return BaseView(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: context.mediaQueryPadding.top),
        child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 128.h - context.mediaQueryPadding.top,),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset('assets/images/logo_skor_id.svg', width: 206.w, height: 49.h, fit: BoxFit.contain,),
              ),
              SizedBox(height: 87.h,),
              Text('Email', style: ThemeTextStyle.nunitoSansRegular.apply(fontSizeDelta: 14.sp, color: Colors.white)),
              SizedBox(height: 3.h,),
              TextField(
                autocorrect: false,
                enableSuggestions: false,
                onChanged: _loginCt.emailOnChange,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                  isDense: true,
                  filled: true,
                  fillColor: Color(0xFF606774).withOpacity(0.3),
                  hintText: 'Masukkan email',
                  hintStyle: ThemeTextStyle.nunitoSansRegular.apply(color: Colors.white.withOpacity(0.5), fontSizeDelta: 16.sp),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0), borderRadius: BorderRadius.all(Radius.circular(8))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0), borderRadius: BorderRadius.all(Radius.circular(8))),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0), borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
              SizedBox(height: 16.h,),
              Text('Password'.tr, style: ThemeTextStyle.nunitoSansRegular.apply(fontSizeDelta: 14.sp, color: Colors.white)),
              SizedBox(height: 3.h,),
              Stack(
                children: [
                  TextField(
                    onChanged: (text) {},
                    autocorrect: false,
                    enableSuggestions: false,
                    onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.sp),
                    obscureText: _loginCt.obsecure.value,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Color(0xFF606774).withOpacity(0.3),
                      contentPadding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 16.w, right: 48.w),
                      hintText: 'Masukan password',
                      hintStyle: ThemeTextStyle.nunitoSansRegular.apply(color: Colors.white.withOpacity(0.5), fontSizeDelta: 16.sp),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0), borderRadius: BorderRadius.all(Radius.circular(8))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0), borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0), borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                  Positioned(
                    right: 16.w, bottom: 0, top: 0,
                    child: GestureDetector(
                      onTap: () => _loginCt.setObsecure(!_loginCt.obsecure.value),
                      child: Icon(_loginCt.obsecure.value ? Icons.visibility_outlined : Icons.visibility_off_outlined, size: 18.w, color: Colors.white.withOpacity(0.3)),
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text('Lupa password', style: ThemeTextStyle.gothamRoundedMedium.apply(fontSizeDelta: 14.sp, color: Colors.white, decoration: TextDecoration.underline)),
                ),
              ),
              SizedBox(height: 8.h,),
              ButtonLoading(
                backgroundColor: Color(0xFFC10011),
                disable: _loginCt.loading.value,
                title: 'Masuk',
                loading: _loginCt.loading.value,
                onTap: () => _loginCt.login(),
                buttonPadding: EdgeInsets.fromLTRB(11.w, 13.h, 11.w, 10.h),
                textStyle: ThemeTextStyle.gothamRoundedMedium.apply(color: Colors.white, fontSizeDelta: 16.sp),
              ),
              SizedBox(height: 24.h,),
              Align(
                alignment: Alignment.center,
                child: Text('Atau', style: ThemeTextStyle.gothamRoundedMedium.apply(color: Color(0xFFBDBDBD), fontSizeDelta: 14.sp),),
              ),
              SizedBox(height: 24.h,),
              ButtonLoading(
                backgroundColor: Color(0xFF3B5998),
                disable: _loginCt.loading.value,
                title: 'Lanjutkan dengan Facebook',
                icon: SvgPicture.asset('assets/images/facebook 1.svg', width: 16.w, height: 16.w,),
                loading: _loginCt.loading.value,
                onTap: () => _loginCt.login(),
                buttonPadding: EdgeInsets.fromLTRB(11.w, 12.h, 11.w, 10.h),
                textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.sp),
              ),
              SizedBox(height: 24.h,),
              ButtonLoading(
                backgroundColor: Color(0xFFDB4437),
                disable: _loginCt.loading.value,
                title: 'Lanjutkan dengan Google',
                icon: SvgPicture.asset('assets/images/Google.svg', width: 16.w, height: 16.w,),
                loading: _loginCt.loading.value,
                onTap: () => _loginCt.login(),
                buttonPadding: EdgeInsets.fromLTRB(11.w, 12.h, 11.w, 10.h),
                textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.sp),
              ),
              GetPlatform.isIOS ?
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: ButtonLoading(
                  backgroundColor: Colors.white,
                  disable: _loginCt.loading.value,
                  title: 'Lanjutkan dengan Apple',
                  icon: SvgPicture.asset('assets/images/apple 1.svg', width: 16.w, height: 16.w,),
                  loading: _loginCt.loading.value,
                  onTap: () => _loginCt.login(),
                  buttonPadding: EdgeInsets.fromLTRB(11.w, 12.h, 11.w, 10.h),
                  textStyle: ThemeTextStyle.biryaniBold.apply(color: Color(0xFF2F3541), fontSizeDelta: 14.sp),
                ),
              ) :
              Container(),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ',
                      style: ThemeTextStyle.nunitoSansRegular.apply(color: Colors.white.withOpacity(0.6), fontSizeDelta: 16.sp),
                      children: [
                        TextSpan(
                          text: 'Daftar Akun',
                          style: ThemeTextStyle.nunitoSansRegular.apply(color: Colors.red.withOpacity(0.6), fontSizeDelta: 16.sp),
                          recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                        )
                      ]
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
