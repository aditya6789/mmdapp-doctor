import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mmdapp_doctor/common/utils/customButton.dart';
import 'package:mmdapp_doctor/landing.dart';
import 'package:mmdapp_doctor/main.dart';
import 'package:mmdapp_doctor/screens/homeScreen.dart';
import 'package:mmdapp_doctor/screens/otp.dart';
import 'package:mmdapp_doctor/services/auth/authServices.dart';
import 'package:mmdapp_doctor/services/auth/doctorServices.dart';
import 'package:mmdapp_doctor/utils/api_utils.dart';
import 'package:mmdapp_doctor/utils/customToasts.dart';
import 'package:open_file/open_file.dart';
import '../utils/global_variable.dart';

import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = TextEditingController();
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast.init(navigatorKey.currentContext!);
  }

  void submitHandler(context) async {
    var number = int.tryParse(loginController.value.text) ?? 0;
    Map resp = await loginSendOtp(number);
    if (resp['success'] == false) {
      // show toast error
      if (resp.containsKey('message')) {
        fToast.showToast(child: errorToast(resp['message']));
      } else {
        fToast.showToast(child: errorToast("Something went wrong"));
      }
    } else {
      if (resp.containsKey('message')) {
        fToast.showToast(child: successToast(resp['message']));
      }
      var number = int.tryParse(loginController.value.text) ?? 0;
      Get.to(() => Otp(mobile: number));
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => Otp(mobile: number)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        "Enter Your Mobile Number",
                        style: TextStyle(
                            fontSize: 20.sp, color: AppColors.mainColor),
                      ),
                      SizedBox(
                        height: 10.h,
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
                        style:
                            TextStyle(color: Colors.black54, fontSize: 15.sp),
                      ),
                      GestureDetector(
                        onTap: () async =>
                            await OpenFile.open("assets/terms.docx"),
                        child: Text(
                          "Terms & Conditions",
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 95, 173),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      const Spacer(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      CustomButton(
                        onPressed: () async => submitHandler(context),
                        text: "Continue",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
