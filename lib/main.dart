import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skor_id_flutter/utils/controller/common_controller.dart';
import 'package:skor_id_flutter/utils/helper/constant.dart';
import 'package:skor_id_flutter/utils/helper/locales_string.dart';
import 'package:skor_id_flutter/utils/helper/text_util.dart';
import 'package:skor_id_flutter/view/forgot_password/forgot_password_view.dart';
import 'package:skor_id_flutter/view/home/home_view.dart';
import 'package:skor_id_flutter/view/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey globalNavigatorKey = GlobalKey<NavigatorState>();
final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
final CommonController commonController = Get.put(CommonController(), permanent: true);
final GoogleSignIn googleSignIn = GoogleSignIn();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await commonController.initValue();
  runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  String title = event.data['notification']['title'] ?? '';

  if (Platform.isAndroid && title != '') await _showAndroidNotification(event.data);
  print('onBackground: ${event.data}');
  _redirectTo(event.data);
  return Future.value(true);
}

_redirectTo(Map<String, dynamic> message) async {
  final redirect = Platform.isAndroid ? message['data']['type'].toString() : message['type'].toString();

  _navigateTo(redirect);
}

_showAndroidNotification(Map<String, dynamic> message) async {
  var androidSetting = AndroidInitializationSettings('bisnis_koe_logo');
  var iosSetting = IOSInitializationSettings();
  var initializationSettings = InitializationSettings(android: androidSetting, iOS: iosSetting);
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (_) => _onSelectNotification(message));

  String? title = message['notification']['title'];
  String? body = message['notification']['body'];

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'balelabs.flutter.core', 'balelabs.flutter.core', 'balelabs.flutter.core',
      importance: Importance.max, priority: Priority.high);
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(TextUtil.randomInt(0, 1000), title, body, platformChannelSpecifics);
}

_onSelectNotification(Map<String, dynamic> message) async {
  final redirect = Platform.isAndroid ? message['data']['type'].toString() : message['type'].toString();
  final preference = await SharedPreferences.getInstance();
  final showForegroundNotification = preference.getBool(Constant.SHOW_FOREGROUND_NOTIFICATION) ?? false;

  if (showForegroundNotification) _navigateTo(redirect);
}

_navigateTo(String redirect) {
  Get.toNamed('/$redirect');
}

class MyApp extends StatefulWidget {
  static const BASE_API = Constant.API_PRODUCTION;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  StreamSubscription? _connection, _fcmRefreshToken;

  _connectivityResult() => commonController.checkConnection();

  _fcmListener() {
    FirebaseMessaging.onMessage.listen((event) async {
      final preference = await SharedPreferences.getInstance();
      preference.setBool(Constant.SHOW_FOREGROUND_NOTIFICATION, false);
      if (Platform.isAndroid) await _showAndroidNotification(event.data);
      print("onMessage: ${event.data}");

      // below code is use only in android platform to prevent onmessage called when notification is not clicked
      Future.delayed(Duration(milliseconds: 500), () => preference.setBool(Constant.SHOW_FOREGROUND_NOTIFICATION, true));

      return Future.value(true);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      String title = event.data['notification']['title'] ?? '';

      if (Platform.isAndroid && title != '') await _showAndroidNotification(event.data);
      print("onResume: ${event.data}");
      _redirectTo(event.data);
      return Future.value(true);
    });
  }

  _initFCM() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await _getFcmToken();

    _fcmListener();
  }

  _getFcmToken() async {
    final preference = await SharedPreferences.getInstance();

    firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      print("FCM_TOKEN $token");
      preference.setString(Constant.FCM_TOKEN, token!);
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

    initDynamicLinks();

    _connection = Connectivity().onConnectivityChanged
        .listen((ConnectivityResult result) => _connectivityResult());

    _initFCM();
  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      Get.toNamed(deepLink.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => GetMaterialApp(
        title: 'SkorId',
        navigatorKey: globalNavigatorKey as GlobalKey<NavigatorState>?,
        initialRoute: (commonController.preferences?.getBool(Constant.IS_LOGIN) ?? false) ? Routes.HOME : Routes.LOGIN,
        getPages: [
          GetPage(name: Routes.HOME, page: () => HomeView()),
          GetPage(name: Routes.LOGIN, page: () => LoginView()),
          GetPage(name: Routes.FORGOT_PASSWORD, page: () => ForgotPasswordView()),
        ],
        translations: LocalesString(),
        locale: Locale(commonController.language.value),
        fallbackLocale: Locale(Constant.INDONESIAN),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}
