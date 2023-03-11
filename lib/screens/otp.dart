import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmdapp_doctor/common/utils/customButton.dart';
import 'package:mmdapp_doctor/screens/homeScreen.dart';
import 'package:mmdapp_doctor/services/auth/authServices.dart';
import 'package:mmdapp_doctor/utils/storage.dart';

import '../utils/global_variable.dart';

class Otp extends StatefulWidget {
  final int mobile;

  Otp({super.key, required this.mobile});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  int otp = 0;

  void handleSubmit(context) async {
    Map<String, dynamic> resp = await verifyOtp(widget.mobile, otp);
    if (resp.containsKey('success')) {
      if (resp['status'].toString() == 206.toString()) {
        // Back to login
      }
      print("success resp");
      print(resp);
      if (resp['success'] == true) {
        LocalStorage().setAuthTokens(resp['response']);
        Navigator.pushReplacementNamed(
            context, '/landing/${HomeScreen.routeName}');
      } else {
        print(resp);
        //Error Show Error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Enter the 6-digit OTP sent to",
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.mobile.toString(),
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30.h,
            ),
            Align(
              alignment: Alignment.center,
              child: OtpTextField(
                numberOfFields: 6,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) async {
                  otp = int.tryParse(verificationCode) ?? 0;
                  handleSubmit(context);
                }, // end onSubmit
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Text(
                  "Didn't receive the code?",
                  style: TextStyle(
                      color: AppColors.lightTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 5.w,
                ),
                GestureDetector(
                  child: Text(
                    "Resend",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            Spacer(),
            CustomButton(
                onPressed: () => handleSubmit(context), text: "Continue"),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
