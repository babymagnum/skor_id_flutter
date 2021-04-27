import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';
import 'package:skor_id_flutter/utils/widgets/no_connection.dart';
import 'package:skor_id_flutter/main.dart';

class BaseView extends StatelessWidget {
  final bool isUseAppbar;
  final String? appbarTitle;
  final Widget? appbarLeading;
  final Widget child;
  final BottomNavigationBar? bottomNavigationBar;

  BaseView({this.isUseAppbar:false, this.appbarTitle, this.appbarLeading, required this.child, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    Widget _appBar = AppBar(
      centerTitle: true,
      title: Text(appbarTitle ?? 'Page Title', style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 20)),
      leading: appbarLeading ?? IconButton(
        icon: Icon(Icons.arrow_back_rounded, color: Colors.black), 
        onPressed: () => Get.back()
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFF292D35),
      appBar: isUseAppbar ? _appBar as PreferredSizeWidget? : null,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        children: [
          Container(width: Get.width, height: Get.height),
          Column(
            children: [
              Expanded(child: child),
              Obx(() => NoConnection(height: commonController.notConnected.value ? 30.h : 0,)),
            ],
          ),
        ],
      ),
    );
  }
}
