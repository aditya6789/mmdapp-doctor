import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmdapp_doctor/landing.dart';
import 'package:mmdapp_doctor/router.dart';
import 'package:mmdapp_doctor/screens/CustomerDetails.dart';
import 'package:mmdapp_doctor/screens/CustomerQueueScreen.dart';
import 'package:mmdapp_doctor/screens/addCustomer.dart';
import 'package:mmdapp_doctor/screens/customers.dart';
import 'package:mmdapp_doctor/screens/homeScreen.dart';
import 'package:mmdapp_doctor/screens/loginScreen.dart';
import 'package:mmdapp_doctor/screens/schedule.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
                child: Text("Loading"),
              ),
              duration: 3000,
              nextScreen: LoginScreen())),
    );
  }
}
