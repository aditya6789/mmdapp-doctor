import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/number_symbols_data.dart';

import '../common/utils/calender.dart';
import '../common/utils/customButton.dart';
import '../common/utils/global_variable.dart';

class Schedule extends StatefulWidget {
  Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  bool _hasBeenPressed = false;
  var _currentIndex = 0;

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
          " Schedule ",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "January",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  "February",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
                Text(
                  "March",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 80.h,
              child: Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Calender(),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                    itemCount: 10),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            GridView.builder(
              itemCount: 20,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 13,
                  mainAxisExtent: 40,
                  mainAxisSpacing: 25),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                      _currentIndex = 0;
                    });
                  },
                  child: Container(
                    width: 150.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: _hasBeenPressed ? Colors.white : Colors.black,
                        border: Border.all(color: Colors.black38, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "10:00 AM",
                        style: TextStyle(
                            color: _hasBeenPressed
                                ? AppColors.mainColorbutton
                                : Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                      child:
                          CustomButtonOutline(onPressed: () {}, text: "Edit")),
                  SizedBox(
                    width: 30.w,
                  ),
                  Expanded(
                      child:
                          CustomButton(onPressed: () {}, text: "Add Schedule"))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
