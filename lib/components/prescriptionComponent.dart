import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mmdapp_doctor/common/utils/customButton.dart';
import 'package:mmdapp_doctor/components/searchQueueComponent.dart';
import 'package:mmdapp_doctor/services/auth/doctorServices.dart';
import 'package:mmdapp_doctor/services/auth/timeslotServices.dart';
import 'package:mmdapp_doctor/utils/customToasts.dart';
import 'package:mmdapp_doctor/utils/pdf/pdfapi.dart';
import 'package:mmdapp_doctor/utils/pdf/pdfgenerateapi.dart';
import '../common/utils/TextFormField.dart';
import '../models/prescriptionModel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../common/utils/global_variable.dart';

class Prescription extends StatefulWidget {
  // final String prescription;
  // final String category;
  final String name;
  final String date;
  final PrescriptionModel presc;

  const Prescription(
      {super.key,
      // required this.prescription,
      // required this.category,
      required this.name,
      required this.date,
      required this.presc});

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Prescription No 1",
              style: TextStyle(color: AppColors.darkTextColor, fontSize: 11.sp),
            ),
            Text(
              widget.date,
              style: TextStyle(color: AppColors.darkTextColor, fontSize: 11.sp),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.name}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/download.svg",
                    color: AppColors.iconDarkColor,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    "Download",
                    style: TextStyle(
                        color: AppColors.iconDarkColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              onTap: () async {
                final pdfFile = await PdfInvoiceApi.generate(widget.presc);
                PdfApi.openFile(pdfFile);
              },
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          thickness: 1,
          height: 2.h,
        )
      ],
    );
  }
}

class PrescriptionComponent extends StatefulWidget {
  const PrescriptionComponent({super.key});

  @override
  State<PrescriptionComponent> createState() => _PrescriptionComponentState();
}

class _PrescriptionComponentState extends State<PrescriptionComponent> {
  FToast fToast = FToast();
  TextEditingController queueIdCtl = TextEditingController();
  TextEditingController povCtl = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
  }

  List<List<Map>> medicineList = [
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
    void addRow() {
      var len = medicineList.length;
      medicineList.add([
        {
          "controller": TextEditingController(),
          "idx": len,
        },
        {
          "controller": TextEditingController(),
          "idx": len,
        },
      ]);

      // Scroll to bottom
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
      medicineList = medicineList;
      setState(() {});
    }

    void buildData() async {
      List medicines_data = [];

      for (var i = 0; i < medicineList.length; i++) {
        var medicine = medicineList[i];
        String medicineName = medicine[0]['controller'].value.text;
        String medicineNote = medicine[1]['controller'].value.text;

        // check if medicine name is empty and medicine note is empty
        if (medicineName.trim() == '' && medicineNote.trim() == '') {
          continue;
        }

        medicines_data.add({
          "idx": i,
          "note": medicineNote,
          "medicine_name": medicineName,
          "drug_to_taken": 1,
          "exists": false
        });
      }

      int queueId = int.tryParse(queueIdCtl.value.text) ?? -1;
      String purposeOfVisit = (povCtl.value.text);
      if (queueId == -1) {
        fToast.showToast(child: errorToast("Select Customer Again"));
      }

      Map data = {
        "purpose_of_visit": purposeOfVisit,
        "symptoms": "",
        "note": "",
        "queue_id": queueId,
        "prescription": null,
        "prescriptionsData": medicines_data
      };

      Map resp = await createPrescription(data);

      if (resp['success']) {
        fToast.showToast(
          child: successToast("Prescription Added Successfully"),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 2),
        );
      } else {
        fToast.showToast(
          child: errorToast("Something Went Wrong"),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 2),
        );
      }
    }

    void removeIdx(int idx) {
      medicineList.removeAt(idx);
      setState(() {});
    }

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  enabled: false,
                  controller: TextEditingController(text: "Current Date"),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Customer Name",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SearchQueue(controller: queueIdCtl)
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reason for Visit",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  controller: povCtl,
                ),
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
                        "Medicine Name",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Direction for Intake",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Container(
                height: 40.h,
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
                                  TextField(
                                    controller: medicineList[idx][0]
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
                                  TextField(
                                      controller: medicineList[idx][1]
                                          ['controller']),
                                ],
                              ),
                            ),
                            (idx == 0)
                                ? const SizedBox(
                                    width: 50,
                                  )
                                : IconButton(
                                    onPressed: () => removeIdx(idx),
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ((idx + 1) == medicineList.length)
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      width: MediaQuery.of(context).size.width,
                                      child: IconButton(
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                          onPressed: addRow),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                  ])
                            : const SizedBox(
                                height: 0,
                              )
                      ],
                    );
                  },
                  itemCount: medicineList.length,
                  controller: scrollController,
                ),
              ),
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
                  Expanded(
                      child: CustomButton(onPressed: buildData, text: "Save"))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
