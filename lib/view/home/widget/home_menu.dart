import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/model/local_model.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';
import 'package:skor_id_flutter/view/home/home_controller.dart';

class HomeMenu extends StatelessWidget {

  final int index;
  final ContainerHomeItem item;
  final Function onClick;

  HomeMenu(this.index, this.item, this.onClick);

  var _containerHomeCt = Get.put(HomeController());

  Color _colorContent() {
    return index == _containerHomeCt.selectedPage.value ? Color(0xFF58A4F8) : Color(0xFFB6B6B9);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onClick,
        child: Container(
          child: Obx(() => Column(
              children: [
                SizedBox(height: 5.h,),
                SvgPicture.asset(item.image, width: 16.w, height: 16.w, color: _colorContent(),),
                SizedBox(height: 4.h,),
                Text(item.label, style: index == _containerHomeCt.selectedPage.value ? ThemeTextStyle.biryaniExtraBold.apply(color: _colorContent(), fontSizeDelta: 10.sp) : ThemeTextStyle.biryaniRegular.apply(color: _colorContent(), fontSizeDelta: 10.sp),),
                SizedBox(height: 6.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
