import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmdapp_doctor/common/utils/global_variable.dart';

import '../common/utils/customButton.dart';
import '../common/utils/otpFormWidget.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
        title: Text(
          "Customer Details",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full Name",
                      style: TextStyle(
                          color: AppColors.mainColorbutton,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Moblie Number",
                      style: TextStyle(
                          color: AppColors.mainColorbutton,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                          color: AppColors.mainColorbutton,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Date of Birth",
                      style: TextStyle(
                          color: AppColors.mainColorbutton,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Address",
                      style: TextStyle(
                          color: AppColors.mainColorbutton,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aditya Paswan",
                      style: TextStyle(
                          fontSize: 12.h, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "+91 789786578",
                      style: TextStyle(
                          fontSize: 12.h, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "adityapaswan@gmail.com",
                      style: TextStyle(
                          fontSize: 12.h, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "25-01-1992",
                      style: TextStyle(
                          fontSize: 12.h, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "2 6thfloor 765jgj678 y58t989jh 6yh",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 12.h, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Pervious Prescriptions",
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainColorbutton),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.w),
              child: CustomButton(
                onPressed: () {},
                text: "Request Access",
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Enter the OTP",
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainColorbutton),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Sent to the Patient Moblie Number",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            OtpFormWidget(),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140),
              child: CustomButton(onPressed: () {}, text: 'submit'),
            )
          ],
        ),
      ),
    );
  }
}
