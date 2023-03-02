import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmdapp_doctor/components/appointmentsComponents.dart';

import '../common/utils/global_variable.dart';

class AppointmentsScreen extends StatefulWidget {
  static const String routeName = 'appoinments';
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Text(
                    "Today's",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Text(
                    "Upcoming",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Text(
                    "Past",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
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
                      date: "20/09/2023",
                      time: "@10:00AM",
                      name: "Aditya Paswan"),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) => UpcomingAppointment(
                      date: "20/09/2023",
                      time: "@10:00AM",
                      name: "Aditya Paswan"),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) => Invoice(
                      invoice: "87657",
                      date: "12/09/2023",
                      category: "sohju",
                      name: "Aditya Paswan"),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: 20),
            )
          ],
        ),
      ),
    );
  }
}
