import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class QueueComponent extends StatelessWidget {
  final String title;
  final String img;

  const QueueComponent({super.key, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 60.h,
          width: 140.w,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: kElevationToShadow[2],
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                    width: 100.w,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    )),
              )),
        ),
        Positioned(
          top: -15,
          right: -15,
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(
              img,
              height: 50.h,
              width: 50.w,
            ),
          ),
        ),
      ],
    );
  }
}
