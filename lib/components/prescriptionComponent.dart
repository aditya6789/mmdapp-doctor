import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mmdapp_doctor/common/utils/customButton.dart';

import '../common/utils/TextFormField.dart';
import '../common/utils/global_variable.dart';

class Prescription extends StatelessWidget {
  // final String prescription;
  // final String category;
  final String name;
  final String date;
  const Prescription(
      {super.key,
      // required this.prescription,
      // required this.category,
      required this.name,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Prescription No 1",
              style: TextStyle(color: AppColors.darkTextColor, fontSize: 11.sp),
            ),
            Text(
              date,
              style: TextStyle(color: AppColors.darkTextColor, fontSize: 11.sp),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${name}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/download.svg",
                  color: AppColors.iconDarkColor,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  "Download",
                  style: TextStyle(
                      color: AppColors.iconDarkColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          thickness: 1,
          height: 2.h,
        )
      ],
    );
  }
}

class AddPrescription extends StatelessWidget {
  const AddPrescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            DateTextFormField(),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customer Name",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reason for Visit",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Medicine Name",
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(),
                ],
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Direction for Intake",
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                  child: CustomButtonOutline(onPressed: () {}, text: "Reset")),
              SizedBox(
                width: 30.w,
              ),
              Expanded(child: CustomButton(onPressed: () {}, text: "Save"))
            ],
          ),
        )
      ],
    );
  }
}
