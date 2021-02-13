import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pln_flutter/utils/widgets/no_connection.dart';
import 'package:pln_flutter/main.dart';

class BaseView extends StatelessWidget {
  final Widget child;
  final BottomNavigationBar bottomNavigationBar;
  BaseView({@required this.child, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
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
