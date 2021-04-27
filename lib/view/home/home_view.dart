import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/model/local_model.dart';
import 'package:skor_id_flutter/view/base_view.dart';
import 'package:skor_id_flutter/view/eSports/esport_view.dart';
import 'package:skor_id_flutter/view/home/home_controller.dart';
import 'package:skor_id_flutter/view/home/widget/home_menu.dart';
import 'package:skor_id_flutter/view/sport/sport_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var _containerHomeCt = Get.put(HomeController());

  _changePage(int index) {
    _containerHomeCt.setSelectedPage(index);
    _containerHomeCt.pageController.jumpToPage(index);
  }

  _openMenu() {

  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _containerHomeCt.pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                SportView(),
                EsportView(),
              ],
            ),
          ),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: Color(0xFF292D35)
            ),
            child: Row(
              children: [
                HomeMenu(0, ContainerHomeItem('Home', 'assets/images/fa-solid_home.svg'), _changePage(0),),
                HomeMenu(1, ContainerHomeItem('Notification', 'assets/images/fa-solid_bell.svg'), _changePage(1),),
                HomeMenu(2, ContainerHomeItem('Summary', 'assets/images/fa-solid_clipboard-check.svg'), _openMenu(),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
