import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/utils/theme/theme_color.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';
import 'package:skor_id_flutter/utils/widgets/button_loading.dart';

class DialogError extends StatelessWidget {

  DialogError({Key? key, this.button2, this.button2Click, this.icons, required this.error, required this.button, required this.buttonClick}): super(key: key);

  final String error;
  final String button;
  final Function buttonClick;
  final IconData? icons;
  final String? button2;
  final Function? button2Click;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(icons == null ? Icons.error : icons, size: 70.w, color: Color(0xFF0D1522).withOpacity(0.6),),
                SizedBox(height: 16.h,),
                Text(error, textAlign: TextAlign.center, maxLines: 5, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.robotoRegular.apply(color: Color(0xFF0D1522), fontSizeDelta: 14.ssp, decoration: TextDecoration.none),),
                SizedBox(height: 24.h,),
                button2 == null ?
                InkWell(
                  onTap: buttonClick as void Function()?,
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    decoration: BoxDecoration(
                      color: ThemeColor.primary,
                      borderRadius: BorderRadius.all(Radius.circular(6))
                    ),
                    child: Text(button, textAlign: TextAlign.center, style: ThemeTextStyle.robotoRegular.apply(color: Colors.white, fontSizeDelta: 14.ssp),),
                  ),
                ) :
                Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: buttonClick as void Function()?,
                        child: Container(
                          width: Get.width, height: 48.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(width: 1, color: ThemeColor.primary)
                          ),
                          child: Center(
                            child: Text(button, textAlign: TextAlign.center, style: ThemeTextStyle.robotoRegular.apply(color: ThemeColor.primary, fontSizeDelta: 14.ssp),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: ButtonLoading(
                        backgroundColor: ThemeColor.primary,
                        disable: false,
                        title: button2!,
                        loading: false,
                        onTap: button2Click!,
                        buttonPadding: EdgeInsets.fromLTRB(11.w, 10.h, 11.w, 10.h),
                        textStyle: ThemeTextStyle.gothamRoundedMedium.apply(color: Colors.white, fontSizeDelta: 16.sp),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
