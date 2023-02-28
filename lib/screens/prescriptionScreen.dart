import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmdapp_doctor/components/components.dart';

import '../common/utils/TextFormField.dart';
import '../common/utils/global_variable.dart';
import '../components/prescriptionComponent.dart';

class PrescriptionScreen extends StatelessWidget {
  static const String routeName = 'prescription';
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
            "Prescriptions",
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
                    "Prescriptions",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Text(
                    "Add New Prescription",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) =>
                    Prescription(date: "20/09/2023", name: "Aditya Paswan"),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                itemCount: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: AddPrescription(),
          ),
        ]),
      ),
    );
  }
}
