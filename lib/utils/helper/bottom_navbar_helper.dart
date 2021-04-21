import 'package:flutter/material.dart';
import 'package:skor_id_flutter/view/account/account_view.dart';
import 'package:skor_id_flutter/view/home/home_view.dart';
import 'package:skor_id_flutter/view/notifikasi/notification_view.dart';

class BottomNavBarHelper{
  static List<BottomNavBar> bottomNavBar() {
    return <BottomNavBar>[
      BottomNavBar('Home', Icon(Icons.home), Icon(Icons.home_outlined)),
      BottomNavBar('Notifikasi', Icon(Icons.notifications), Icon(Icons.notifications_none)),
      BottomNavBar('Akun', Icon(Icons.person), Icon(Icons.person_outline_outlined)),
    ];
  }

  static List<Widget> bottomNavBarScreen(){
    return [
      HomeView(),
      NotificationView(),
      AccountView()
    ];
  }
}

class BottomNavBar{
  const BottomNavBar(this.title, this.iconActive, this.iconInActive);
  final String title;
  final Widget iconActive;
  final Widget iconInActive;
}