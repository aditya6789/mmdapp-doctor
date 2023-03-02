import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayComponent extends StatelessWidget {
  final String name;
  final String type;
  final String time;
  final String date;

  const TodayComponent(
      {super.key,
      required this.name,
      required this.type,
      required this.time,
      required this.date});

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
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  name,
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          thickness: 2,
          height: 1,
        )
      ],
    );
  }
}
