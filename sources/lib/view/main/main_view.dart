import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pln_flutter/utils/helper/bottom_navbar_helper.dart';
import 'package:pln_flutter/view/base_view.dart';
import 'package:pln_flutter/view/main/main_controller.dart';

class MainView extends StatefulWidget {
  final int? initPage;
  MainView({this.initPage});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController _mainCt = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    if(widget.initPage != null) _mainCt.currentPageOnChange(widget.initPage!);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => BaseView(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _mainCt.currentPage.value,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[400],
        selectedLabelStyle: Theme.of(context).textTheme.bodyText2,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyText2,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _mainCt.currentPageOnChange(index),
        items: BottomNavBarHelper.bottomNavBar().map((BottomNavBar item) {
          return new BottomNavigationBarItem(
            icon: item.iconInActive,
            activeIcon: item.iconActive,
            label: item.title
          );
        }).toList()
      ),
      child: BottomNavBarHelper.bottomNavBarScreen()[_mainCt.currentPage.value],
    ));
  }
}
