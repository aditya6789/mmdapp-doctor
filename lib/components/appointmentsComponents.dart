import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../common/utils/global_variable.dart';

class Appointment extends StatelessWidget {
  final String date;
  final String time;
  final String name;

  Appointment(
      {super.key, required this.date, required this.time, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: TextStyle(fontSize: 11.sp)),
                SizedBox(
                  height: 10.h,
                ),
                Text(name,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(time,
                    style: TextStyle(
                      fontSize: 11.sp,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 80.w,
                  height: 20.h,
                  color: Colors.green,
                  child: Center(
                      child: Text(
                    "Confirmed",
                    style: TextStyle(color: Colors.white),
                  )),
                )
              ],
            )
          ],
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}

class UpcomingAppointment extends StatelessWidget {
  final String date;
  final String time;
  final String name;

  UpcomingAppointment(
      {super.key, required this.date, required this.time, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: TextStyle(fontSize: 11.sp)),
                SizedBox(
                  height: 10.h,
                ),
                Text(name,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(time,
                    style: TextStyle(
                      fontSize: 11.sp,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 80.w,
                    height: 20.h,
                    color: Colors.green,
                    child: Center(
                        child: Text(
                      "Confirmed",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}

class Invoice extends StatelessWidget {
  final String invoice;
  final String category;
  final String name;
  final String date;
  const Invoice(
      {super.key,
      required this.invoice,
      required this.category,
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
              date,
              style: TextStyle(color: AppColors.darkTextColor, fontSize: 11.sp),
            ),
            Text(
              "Invoice No: #${invoice}",
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
                  "Invoice",
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
