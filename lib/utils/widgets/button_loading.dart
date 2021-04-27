import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonLoading extends StatelessWidget {

  ButtonLoading({Key? key, required this.backgroundColor, required this.disable,
    required this.title, required this.loading, required this.onTap, required this.textStyle,
    required this.buttonPadding, this.loadingSize = 17,
    this.borderRadius = 6, this.icon}): super(key: key);

  final String title;
  final bool loading;
  final Function onTap;
  final bool disable;
  final Color backgroundColor;
  final EdgeInsets buttonPadding;
  final double loadingSize;
  final TextStyle textStyle;
  final double borderRadius;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disable ? null : onTap as void Function()?,
      child: Container(
        padding: buttonPadding,
        decoration: BoxDecoration(
          color: disable ? Color(0xFFC4C4C4) : backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))
        ),
        child: Center(
          child: loading ?
          Stack(
            children: [
              Opacity(
                opacity: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon == null ? Container() : Padding(
                      padding: EdgeInsets.only(right: 12.w, bottom: 4.h),
                      child: icon!,
                    ),
                    Text(title, style: textStyle),
                  ],
                ),
              ),
              Positioned(
                left: 0, right: 0, top: 0, bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: loadingSize.w, width: loadingSize.w,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ) :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon == null ? Container() : Padding(
                padding: EdgeInsets.only(right: 12.w, bottom: 4.h),
                child: icon!,
              ),
              Text(title, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
