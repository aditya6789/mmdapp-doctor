import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmdapp_doctor/common/utils/global_variable.dart';
import 'package:mmdapp_doctor/components/patientsComponent.dart';
import 'package:mmdapp_doctor/components/todayComponent.dart';
import 'package:mmdapp_doctor/controllers/appoinmentsController.dart';
import 'package:mmdapp_doctor/controllers/homeController.dart';
import 'package:mmdapp_doctor/landing.dart';
import 'package:mmdapp_doctor/models/billingModel.dart';
import 'package:mmdapp_doctor/screens/CustomerQueueScreen.dart';
import 'package:mmdapp_doctor/screens/addCustomer.dart';
import 'package:mmdapp_doctor/screens/appointmentsScreen.dart';
import 'package:mmdapp_doctor/screens/billingScreen.dart';
import 'package:mmdapp_doctor/screens/doctorProfileScreen.dart';
import 'package:mmdapp_doctor/services/auth/doctorServices.dart';

import '../components/appointmentsComponents.dart';
import '../components/queueComponent.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map dashboardStats = {};

  @override
  void initState() {
    super.initState();
    getDashboardStats().then((resp) {
      if (resp['success'] == true) {
        setState(() {
          dashboardStats = resp['data'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final patientsController = Get.put((PatientsController()));
    final appController = Get.put((AppointmentController()));

    return Scaffold(
      appBar: AppBar(
        // title: SvgPicture.asset(
        //   "assets/icons/medbook.png",
        //   height: 20,
        //   width: 60,
        // ),
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            //make it circle
            width: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 202, 202, 202)),

            //Round svg
            child: Padding(
              padding: EdgeInsets.all(5),
              child: SvgPicture.asset(
                "assets/doctor.svg",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        title: Image.asset("assets/icons/medbook.png"),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          SvgPicture.asset("assets/icons/notification.svg"),
          GestureDetector(
              onTap: () {
                Get.to(DoctorProfileScreen());
              },
              child: SvgPicture.asset("assets/icons/community.svg")),
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
                    future: patientsController.fetchDashboardStats(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingScreen(
                              subRoute: AppointmentsScreen.routeName,
                            ),
                          ));
                    },
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
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: (appController.todayAppointments.value?.isEmpty ??
                          true)
                      ? Center(
                          child: Text("No Today's Appointments"),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) => Appointment(
                              date: appController.todayAppointments
                                      .value?[index].appointmentDate ??
                                  '[Date]',
                              time: appController.todayAppointments.value?[index].startTime ??
                                  '[StartTime]',
                              status: appController.todayAppointments.value?[index].status
                                      .toString() ??
                                  '0',
                              id: appController.todayAppointments.value?[index].id ??
                                  -1,
                              name: appController.todayAppointments
                                      .value?[index].patientName ??
                                  '[Pat. Name]'),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                          itemCount: appController.todayAppointments.value?.length ?? 0),
                ),
              ),
            ]),
      )),
    );
  }
}
