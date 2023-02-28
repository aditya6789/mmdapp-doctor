import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayComponent extends StatelessWidget {
  const TodayComponent({super.key});

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
                  "13/01/2022",
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Suguna M",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "@10:00AM",
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "New Patient",
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
