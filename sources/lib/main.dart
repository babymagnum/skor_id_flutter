import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pln_flutter/utils/controller/common_controller.dart';
import 'package:pln_flutter/utils/helper/constant.dart';
import 'package:pln_flutter/utils/helper/locales_string.dart';
import 'package:pln_flutter/utils/helper/text_util.dart';
import 'package:pln_flutter/view/main/main_view.dart';
import 'package:pln_flutter/view/splash/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey globalNavigatorKey = GlobalKey<NavigatorState>();
final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
final CommonController commonController = Get.put(CommonController(), permanent: true);
final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

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

  StreamSubscription _connection, _fcmRefreshToken;

  _connectivityResult() => commonController.checkConnection();

  _navigateTo(String redirect) {
    if (redirect == 'main') {
      Get.to(MainView());
    }
  }

  _redirectTo(Map<String, dynamic> message) async {
    final redirect = Platform.isAndroid ? message['data']['type'].toString() ?? '' : message['type'].toString() ?? '';

    _navigateTo(redirect);
  }

  _onSelectNotification(Map<String, dynamic> message) async {
    final redirect = Platform.isAndroid ? message['data']['type'].toString() ?? '' : message['type'].toString() ?? '';
    final preference = await SharedPreferences.getInstance();
    final showForegroundNotification = preference.getBool(Constant.SHOW_FOREGROUND_NOTIFICATION) ?? false;

    if (showForegroundNotification) _navigateTo(redirect);
  }

  _showAndroidNotification(Map<String, dynamic> message) async {
    var androidSetting = AndroidInitializationSettings('bisnis_koe_logo');
    var iosSetting = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidSetting, iOS: iosSetting);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (_) => _onSelectNotification(message));

    String title = message['notification']['title'];
    String body = message['notification']['body'];

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'balelabs.flutter.core', 'balelabs.flutter.core', 'balelabs.flutter.core',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(TextUtil.randomInt(0, 1000), title, body, platformChannelSpecifics);
  }

  _fcmListener() {
    firebaseMessaging.configure(
      /// Android : For now fired when apps is in foreground
      onMessage: (Map<String, dynamic> message) async {
        final preference = await SharedPreferences.getInstance();
        preference.setBool(Constant.SHOW_FOREGROUND_NOTIFICATION, false);
        if (Platform.isAndroid) await _showAndroidNotification(message);
        print("onMessage: $message");

        // below code is use only in android platform to prevent onmessage called when notification is not clicked
        Future.delayed(Duration(milliseconds: 500), () => preference.setBool(Constant.SHOW_FOREGROUND_NOTIFICATION, true));

        return Future.value(true);
      },
      /// Android : Fired when notification clicked and the apps is killed
      onLaunch: (Map<String, dynamic> message) async {
        String title = message['notification']['title'] ?? '';

        if (Platform.isAndroid && title != '') await _showAndroidNotification(message);
        print("onLaunch: $message");
        _redirectTo(message);
        return Future.value(true);
      },
      /// Fired when notification clicked and apps is in background
      onResume: (Map<String, dynamic> message) async {
        String title = message['notification']['title'] ?? '';

        if (Platform.isAndroid && title != '') await _showAndroidNotification(message);
        print("onResume: $message");
        _redirectTo(message);
        return Future.value(true);
      },
    );
  }

  _initFCM() async {
    firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true, provisional: true));
    await _getFcmToken();
    _fcmListener();
  }

  _getFcmToken() async {
    final preference = await SharedPreferences.getInstance();

    firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print("FCM_TOKEN $token");
      preference.setString(Constant.FCM_TOKEN, token);
    });
    _fcmRefreshToken = firebaseMessaging.onTokenRefresh.listen((newToken) {
      print("NEW_FCM_TOKEN $newToken");
      if (newToken != preference.getString(Constant.FCM_TOKEN)) preference.setString(Constant.FCM_TOKEN, newToken);
    });
  }

  @override
  void dispose() {
    _connection?.cancel();
    _fcmRefreshToken?.cancel();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Connectivity().checkConnectivity().then((result) => _connectivityResult());

    _connection = Connectivity().onConnectivityChanged
        .listen((ConnectivityResult result) => _connectivityResult());

    _initFCM();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
      // TODO: Change Size based on design draft later
      designSize: Size(360, 640),
      allowFontScaling: true,
      builder: () => GetMaterialApp(
        title: 'Balelabs Flutter',
        navigatorKey: globalNavigatorKey,
        home: SplashView(),
        translations: LocalesString(),
        locale: Locale(commonController.language.value),
        fallbackLocale: Locale(Constant.INDONESIAN),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
