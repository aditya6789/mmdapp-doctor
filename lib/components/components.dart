import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mmdapp_doctor/common/utils/global_variable.dart';

class CustomerQueue extends StatelessWidget {
  final String date;
  final String time;
  final String name;

  CustomerQueue(
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
                Text(date, style: TextStyle(fontSize: 12.sp)),
                SizedBox(
                  height: 10.h,
                ),
                Text(name,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(time,
                    style: TextStyle(
                      fontSize: 12.sp,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 80.w,
                  height: 20.h,
                  color: AppColors.mainColorbutton,
                  child: Center(
                      child: Text(
                    "View",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ],
            )
          ],
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}

class CustomersComponent extends StatelessWidget {
  final String date;
  final String number;
  final String name;
  final String visit;

  CustomersComponent(
      {super.key,
      required this.date,
      required this.number,
      required this.name,
      required this.visit});

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
                Text('Total Visits:${visit}',
                    style: TextStyle(fontSize: 12.sp)),
                SizedBox(
                  height: 10.h,
                ),
                Text(name,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Moblie No${number}',
                    style: TextStyle(
                      fontSize: 12.sp,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Text('Last Visited${date}',
                    style: TextStyle(
                      fontSize: 12.sp,
                    )),
              ],
            )
          ],
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
