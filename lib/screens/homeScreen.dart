import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmdapp_doctor/common/utils/global_variable.dart';
import 'package:mmdapp_doctor/components/patientsComponent.dart';
import 'package:mmdapp_doctor/components/todayComponent.dart';
import 'package:mmdapp_doctor/controllers/homeController.dart';
import 'package:mmdapp_doctor/screens/CustomerQueueScreen.dart';
import 'package:mmdapp_doctor/screens/addCustomer.dart';
import 'package:mmdapp_doctor/screens/billingScreen.dart';

import '../components/appointmentsComponents.dart';
import '../components/queueComponent.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final patientsController = Get.put((PatientsController()));
    final todayController = Get.put((TodayController()));

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
                child: FutureBuilder(
                    future: patientsController.fetchPatientsDetails('1'),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => PatientsComponent(
                                img: patientsController
                                    .patientsDetails.value!.img[index]
                                    .toString(),
                                number: patientsController
                                    .patientsDetails.value!.number[index]
                                    .toString(),
                                day: patientsController
                                    .patientsDetails.value!.day[index]
                                    .toString(),
                                title: patientsController
                                    .patientsDetails.value!.title[index]
                                    .toString(),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: 3);
                    }),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCustomer(),
                          ));
                    },
                    child: QueueComponent(
                      title: "Add Customer to Queue",
                      img: "assets/icons/add_queue.svg",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomerQueueScreen(),
                          ));
                    },
                    child: QueueComponent(
                      title: "View Customer to Queue",
                      img: "assets/icons/view_queue.svg",
                    ),
                  ),
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
                child: FutureBuilder(
                    future: todayController.fetchTodayDetails('1'),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      return ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => TodayComponent(
                                name: todayController
                                    .todayDetails.value!.name[index]
                                    .toString(),
                                date: todayController
                                    .todayDetails.value!.date[index]
                                    .toString(),
                                time: todayController
                                    .todayDetails.value!.time[index]
                                    .toString(),
                                type: todayController
                                    .todayDetails.value!.type[index]
                                    .toString(),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: 3);
                    }),
              ),
            ]),
      )),
    );
  }
}
