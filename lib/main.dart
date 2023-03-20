import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mmdapp_doctor/router.dart';
import 'package:mmdapp_doctor/screens/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: (settings) =>
                genarateRoute(settings), // auto genarating routes
            home: AnimatedSplashScreen(
                splash: Center(
                  child: Image.asset(
                    'assets/icons/medbook.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                duration: 3000,
                nextScreen: const LoginScreen())),
      ),
      navigatorKey: navigatorKey,
      builder: FToastBuilder(),
    );
  }
}
