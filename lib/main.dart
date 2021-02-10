import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:pln_flutter/utils/controller/common_controller.dart';
import 'package:pln_flutter/utils/helper/locales_string.dart';
import 'package:pln_flutter/utils/helper/constant.dart';
import 'package:pln_flutter/view/home/home_view.dart';
import 'package:pln_flutter/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();
final commonController = Get.put(CommonController(), permanent: true);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await commonController.initValue();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const BASE_API = Constant.API_PRODUCTION;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  StreamSubscription _connection;

  _connectivityResult(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile) {
      commonController.setNotConnected(false);
    } else if (result == ConnectivityResult.wifi) {
      commonController.setNotConnected(false);
    } else {
      commonController.setNotConnected(true);
    }
  }

  @override
  void dispose() {
    _connection?.cancel();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Connectivity().checkConnectivity().then((result) => _connectivityResult(result));

    _connection = Connectivity().onConnectivityChanged
        .listen((ConnectivityResult result) => _connectivityResult(result));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
      // TODO: Change Size based on design draft later
      designSize: Size(360, 640),
      allowFontScaling: true,
      builder: () => GetMaterialApp(
        title: 'SIMKP PLN',
        navigatorKey: globalNavigatorKey,
        home: (commonController?.preferences?.getBool(Constant.IS_LOGIN) ?? false) ? HomeView() : LoginView(),
        translations: LocalesString(),
        locale: Locale(commonController.language.value),
        fallbackLocale: Locale(Constant.INDONESIAN),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
