import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpFormWidget extends StatelessWidget {
  const OtpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50.w,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                onChanged: (val) {
                  if (val.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                  // authController.enteredOtp.value += val;
                },
                style: TextStyle(height: 1.5, fontSize: 20),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(top: 30, bottom: 30, left: 30),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 50.w,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                onChanged: (val) {
                  if (val.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                  // authController.enteredOtp.value += val;
                },
                style: TextStyle(height: 1.5, fontSize: 20),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(top: 30, bottom: 30, left: 30),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 50.w,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                onChanged: (val) {
                  if (val.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                  // authController.enteredOtp.value += val;
                },
                style: TextStyle(height: 1.5, fontSize: 20),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(top: 30, bottom: 30, left: 30),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 50.w,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                onChanged: (val) {
                  if (val.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                  // authController.enteredOtp.value += val;
                },
                style: TextStyle(height: 1.5, fontSize: 20),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(top: 30, bottom: 30, left: 30),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 50.w,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                onChanged: (val) {
                  if (val.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                  // authController.enteredOtp.value += val;
                },
                style: TextStyle(height: 1.5, fontSize: 20),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(top: 30, bottom: 30, left: 30),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 50.w,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                onChanged: (val) {
                  if (val.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                  // authController.enteredOtp.value += val;
                },
                style: TextStyle(height: 1.5, fontSize: 20),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(top: 30, bottom: 30, left: 30),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
