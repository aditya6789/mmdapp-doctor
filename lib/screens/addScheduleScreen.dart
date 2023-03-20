// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mmdapp_doctor/common/utils/global_variable.dart';
import 'package:mmdapp_doctor/services/auth/timeslotServices.dart';
import 'package:mmdapp_doctor/utils/customToasts.dart';

import '../common/utils/TextFormField.dart';
import '../common/utils/customButton.dart';

class AddScheduleScreen extends StatefulWidget {
  static const String routeName = 'schedule';
  const AddScheduleScreen({super.key});

  @override
  State<AddScheduleScreen> createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends State<AddScheduleScreen> {
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
  }

  List<List<Map>> timeslots = [
    [
      {
        "controller": TextEditingController(),
        "idx": 0,
      },
      {
        "controller": TextEditingController(),
        "idx": 0,
      },
    ],
  ];
  @override
  Widget build(BuildContext context) {
    TextEditingController fromDate = TextEditingController();
    TextEditingController toDate = TextEditingController();

    //function for reseting the form
    void resetForm() {
      fromDate.clear();
      toDate.clear();
      timeslots = [
        [
          {
            "controller": TextEditingController(),
            "idx": 0,
          },
          {
            "controller": TextEditingController(),
            "idx": 0,
          },
        ],
      ];
      setState(() {
        timeslots = timeslots;
      });
    }

    void addRow() {
      var len = timeslots.length;
      timeslots.add([
        {
          "controller": TextEditingController(),
          "idx": len,
        },
        {
          "controller": TextEditingController(),
          "idx": len,
        },
      ]);

      setState(() {
        timeslots = timeslots;
      });
    }

    void removeRow(int idx) {
      timeslots.removeAt(idx);
      setState(() {
        timeslots = timeslots;
      });
    }

    void buildData() async {
      List timeslots_data = [];
      for (var i = 0; i < timeslots.length; i++) {
        var timeslot = timeslots[i];
        String start_time = timeslot[0]['controller'].value.text;
        String end_time = timeslot[1]['controller'].value.text;
        timeslots_data
            .add({"startTime": start_time, "endTime": end_time, "idx": i});
      }

      Map data = {
        "timespan": {
          "fromDate": getYYMMDD(fromDate.value.text),
          "toDate": getYYMMDD(toDate.value.text)
        },
        "timeslots": timeslots_data,
      };

      print(data);
      Map resp = await addDateTimeSlots(data);

      if (resp.containsKey("msg")) {
        if (resp['success']) {
          fToast.showToast(
            child: successToast(resp['msg']),
            gravity: ToastGravity.BOTTOM,
            toastDuration: const Duration(seconds: 2),
          );
        } else {
          fToast.showToast(
            child: errorToast(resp['msg']),
            gravity: ToastGravity.BOTTOM,
            toastDuration: const Duration(seconds: 2),
          );
        }

        print(resp['msg']);
      }
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              )),
          title: const Text(
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
              children: [
                Column(
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
                              BirthTextFormField(
                                controller: fromDate,
                              ),
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
                              BirthTextFormField(
                                controller: toDate,
                              ),
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
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, idx) {
                      return Column(
                        children: [
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
                                      controller: timeslots[idx][0]
                                          ['controller'],
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
                                        controller: timeslots[idx][1]
                                            ['controller']),
                                  ],
                                ),
                              ),
                              (idx != 0)
                                  ? IconButton(
                                      icon: const Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => removeRow(idx),
                                    )
                                  : const SizedBox(
                                      width: 50,
                                    )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ((idx + 1) == timeslots.length)
                              ? Column(children: [
                                  IconButton(
                                      icon: const Icon(Icons.add_circle),
                                      onPressed: addRow),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: CustomButtonOutline(
                                                onPressed: resetForm,
                                                text: "Reset")),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        Expanded(
                                            child: CustomButton(
                                                onPressed: buildData,
                                                text: "Save"))
                                      ],
                                    ),
                                  )
                                ])
                              : const SizedBox(
                                  height: 0,
                                )
                        ],
                      );
                    },
                    itemCount: timeslots.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
