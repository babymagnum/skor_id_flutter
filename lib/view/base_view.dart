import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pln_flutter/utils/widgets/no_connection.dart';
import 'package:pln_flutter/main.dart';

class BaseView extends StatefulWidget {

  BaseView({@required @required this.child});

  final Widget child;

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: [
          Container(width: Get.width, height: Get.height,),
          Column(
            children: [
              Expanded(child: widget.child),
              Obx(() => NoConnection(height: commonController.notConnected.value ? 30.h : 0,)),
            ],
          ),
        ],
      ),
    );
  }
}
