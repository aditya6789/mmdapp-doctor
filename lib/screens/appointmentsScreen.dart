import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmdapp_doctor/components/appointmentsComponents.dart';
import 'package:mmdapp_doctor/controllers/appoinmentsController.dart';

import '../common/utils/global_variable.dart';

class AppointmentsScreen extends StatefulWidget {
  static const String routeName = 'appoinments';
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen>
    with SingleTickerProviderStateMixin {
  final appController = Get.put(AppointmentController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: FutureBuilder(
          future: appController.fetchAppointmentDetails(),
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 80,
                leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    )),
                title: Text(
                  "Appointments",
                  style: TextStyle(color: Colors.blue),
                ),
                bottom: TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: AppColors.mainColorbutton,
                    indicatorColor: AppColors.mainColorbutton,
                    indicatorSize: TabBarIndicatorSize.label,
                    onTap:(int t)=> setState(() {}),
                    tabs: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Text(
                          "Today's",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Text(
                          "Upcoming",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Text(
                          "Past",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                backgroundColor: Colors.white,
                elevation: 1,
              ),
              body: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) => Appointment(
                            date: appController.todayAppointments.value?[index]
                                    .appointmentDate ??
                                '[Date]',
                            time: appController.todayAppointments.value?[index]
                                    .startTime ??
                                '[StartTime]',
                            status: appController
                                    .todayAppointments.value?[index].status
                                    .toString() ??
                                '0',
                            id: appController.todayAppointments.value?[index].id ??
                                -1,
                            name: appController.todayAppointments.value?[index]
                                    .patientName ??
                                '[Pat. Name]'),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: appController.todayAppointments.value?.length ?? 0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) => UpcomingAppointment(
                            date: appController.upcomingAppointments
                                    .value?[index].appointmentDate ??
                                '[Date]',
                            time: appController.upcomingAppointments
                                    .value?[index].startTime ??
                                '[StartTime]',
                            status: appController
                                    .upcomingAppointments.value?[index].status
                                    .toString() ??
                                '0',
                            id: appController.upcomingAppointments.value?[index].id ??
                                -1,
                            name: appController.upcomingAppointments
                                    .value?[index].patientName ??
                                '[Pat. Name]'),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: appController.upcomingAppointments.value?.length ?? 0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) => Invoice(
                            invoice: '#8677',
                            date: appController.pastAppointments.value?[index]
                                    .appointmentDate ??
                                '[Date]',
                            name: appController.pastAppointments.value?[index]
                                    .patientName ??
                                ''),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount:
                            appController.pastAppointments.value?.length ?? 0),
                  )
                ],
              ),
            );
          },
        ));
  }
}
