import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmdapp_doctor/common/utils/customButton.dart';
import 'package:mmdapp_doctor/landing.dart';
import 'package:mmdapp_doctor/screens/homeScreen.dart';
import 'package:mmdapp_doctor/screens/otp.dart';
import 'package:mmdapp_doctor/services/auth/authServices.dart';
import 'package:mmdapp_doctor/utils/api_utils.dart';
import '../utils/global_variable.dart';

import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    bool authenticated = await isUserAuthenticated();
    if (authenticated) {
      Get.to(LandingScreen(
        subRoute: 'home',
      ));
    }
  }

  void submitHandler(context) async {
    var number = int.tryParse(loginController.value.text) ?? 0;
    Map resp = await loginSendOtp(number);
    if (resp['success'] == false) {
      // show toast error
    } else {
      var number = int.tryParse(loginController.value.text) ?? 0;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Otp(mobile: number)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Enter Your Mobie Number",
                style: TextStyle(fontSize: 20.sp, color: AppColors.mainColor),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        "+91",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Image.asset("assets/dropdown.png"),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: loginController,
                          onChanged: ((value) =>
                              {print(loginController.value.text)}),
                          decoration: const InputDecoration(
                            hintText: "Moblie Number",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "By continuing , you agree to our",
                style: TextStyle(color: Colors.black54, fontSize: 15.sp),
              ),
              Text(
                "Terms & Conditions",
                style: TextStyle(color: Colors.blue, fontSize: 15.sp),
              ),
              const Spacer(),
              const Spacer(),
              CustomButton(
                onPressed: () async => submitHandler(context),
                text: "Continue",
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
