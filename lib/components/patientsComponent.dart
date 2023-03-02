import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PatientsComponent extends StatelessWidget {
  final String img;
  final String title;
  final String number;
  final String day;

  const PatientsComponent(
      {super.key,
      required this.img,
      required this.title,
      required this.number,
      required this.day});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.w,
          height: 180.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: kElevationToShadow[2],
              color: Colors.white),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    img,
                    height: 100.h,
                    width: 100.w,
                  ),
                ),
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  number,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  day,
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
