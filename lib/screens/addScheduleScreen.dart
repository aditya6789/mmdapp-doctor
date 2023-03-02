import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmdapp_doctor/common/utils/global_variable.dart';

import '../common/utils/TextFormField.dart';
import '../common/utils/customButton.dart';

class AddScheduleScreen extends StatelessWidget {
  static const String routeName = 'schedule';
  const AddScheduleScreen({super.key});

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
          "Add Schedule ",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From Date',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        BirthTextFormField(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From Date',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        BirthTextFormField(),
                      ],
                    ),
                  )
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
                        BirthTextFormField(),
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
                        BirthTextFormField(),
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
                        BirthTextFormField(),
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
                        BirthTextFormField(),
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
                        BirthTextFormField(),
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
                        BirthTextFormField(),
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
                        BirthTextFormField(),
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
                        BirthTextFormField(),
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
                        BirthTextFormField(),
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
                        BirthTextFormField(),
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
                        child: CustomButtonOutline(
                            onPressed: () {}, text: "Reset")),
                    SizedBox(
                      width: 30.w,
                    ),
                    Expanded(
                        child: CustomButton(onPressed: () {}, text: "Save"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
