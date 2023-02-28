import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mmdapp_doctor/common/utils/global_variable.dart';
import 'package:mmdapp_doctor/components/patientsComponent.dart';
import 'package:mmdapp_doctor/components/todayComponent.dart';
import 'package:mmdapp_doctor/screens/billingScreen.dart';

import '../components/appointmentsComponents.dart';
import '../components/queueComponent.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: SvgPicture.asset(
        //   "assets/icons/medbook.png",
        //   height: 20,
        //   width: 60,
        // ),
        title: Image.asset("assets/icons/medbook.png"),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          SvgPicture.asset("assets/icons/notification.svg"),
          SvgPicture.asset("assets/icons/community.svg"),
        ],
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => PatientsComponent(),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                    itemCount: 3),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QueueComponent(),
                  QueueComponent(),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's",
                    style: TextStyle(
                        color: AppColors.mainColorbutton,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    child: Text(
                      "ViewMore",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => TodayComponent(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: 3),
              ),
            ]),
      )),
    );
  }
}
