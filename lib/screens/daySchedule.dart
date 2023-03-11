import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/utils/TextFormField.dart';
import '../common/utils/customButton.dart';
import '../common/utils/global_variable.dart';
import '../components/circleDay.dart';

class DaySchedule extends StatefulWidget {
  const DaySchedule({super.key});

  @override
  State<DaySchedule> createState() => _DayScheduleState();
}

class _DayScheduleState extends State<DaySchedule> {
  @override
  Widget build(BuildContext context) {
    TextEditingController timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
        title: Text(
          " Add Schedule ",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select By Days",
              style: TextStyle(
                  color: AppColors.mainColorbutton,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleDay(
                  day: "MON",
                ),
                SizedBox(width: 10.w),
                CircleDay(
                  day: "TUE",
                ),
                SizedBox(width: 10.w),
                CircleDay(
                  day: "WED",
                ),
                SizedBox(width: 10.w),
                CircleDay(
                  day: "THU",
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleDay(
                  day: "FRI",
                ),
                SizedBox(width: 10.w),
                CircleDay(
                  day: "SAT",
                ),
                SizedBox(width: 10.w),
                CircleDay(
                  day: "SUN",
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Add Time Slots",
              style: TextStyle(
                  color: AppColors.mainColorbutton,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      TimeTextFormField(
                        controller: timeController,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      TimeTextFormField(
                        controller: timeController,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.delete),
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
                        'Start Time',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      TimeTextFormField(
                        controller: timeController,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      TimeTextFormField(
                        controller: timeController,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.delete),
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
                      child:
                          CustomButtonOutline(onPressed: () {}, text: "Reset")),
                  SizedBox(
                    width: 30.w,
                  ),
                  Expanded(child: CustomButton(onPressed: () {}, text: "Save"))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
