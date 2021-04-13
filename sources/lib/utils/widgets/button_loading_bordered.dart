import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonLoadingBordered extends StatelessWidget {

  ButtonLoadingBordered({Key key, @required this.borderColor, @required this.disable, this.fontSize, @required this.title,
    @required this.loading, @required this.onTap, @required this.textStyle, this.loadingSize = 17,
    @required this.borderRadius, this.imageLeftSize, this.horizontalPadding = 10, this.verticalPadding = 5}): super(key: key);

  final String title;
  final bool loading;
  final Function onTap;
  final double fontSize;
  final bool disable;
  final Color borderColor;
  final TextStyle textStyle;
  final double loadingSize;
  final double borderRadius;
  final double imageLeftSize;
  final double verticalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disable ? null : onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w, vertical: verticalPadding.h),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: disable ? Color(0xFFC4C4C4) : borderColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))
        ),
        child: Center(
          child: loading ?
          Stack(
            children: [
              Opacity(
                opacity: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: Text(title, style: textStyle,),
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
          Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: Text(title, style: textStyle,),
          ),
        ),
      ),
    );
  }

}
