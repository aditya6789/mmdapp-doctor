import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mmdapp_doctor/models/billingModel.dart';
import 'package:mmdapp_doctor/services/auth/appointmentServices.dart';
import 'package:mmdapp_doctor/utils/pdf/pdfapi.dart';
import 'package:mmdapp_doctor/utils/pdf/pdfgenerateapi.dart';

import '../common/utils/global_variable.dart';

class Appointment extends StatefulWidget {
  final String date;
  final String time;
  final String name;
  final String status;
  final int id;

  const Appointment({
    super.key,
    required this.date,
    required this.time,
    required this.name,
    required this.status,
    required this.id,
  });

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  String updatedStatus = '';

  void onStatusChange(String? value) {
    int status = int.tryParse(value.toString()) ?? -1;
    if (status == -1) {
      return;
    }

    updateAppointment(widget.id.toString(), status).then((resp) {
      if (resp['success']) {
        updatedStatus = status.toString();
        setState(() {
          updatedStatus = status.toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.date, style: TextStyle(fontSize: 11.sp)),
                SizedBox(
                  height: 10.h,
                ),
                Text(widget.name,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.time,
                    style: TextStyle(
                      fontSize: 11.sp,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: '0',
                      child: Container(
                        child: const Text(
                          "Pending",
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 247, 132, 8),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '1',
                      child: Container(
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Container(
                        child: const Text(
                          "Rejected",
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                      ),
                    ),
                  ],
                  onChanged: onStatusChange,
                  value: (updatedStatus == '') ? widget.status : updatedStatus,
                )
              ],
            )
          ],
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}

class UpcomingAppointment extends StatefulWidget {
  final String date;
  final String time;
  final String status;
  final String name;
  final int id;

  const UpcomingAppointment({
    super.key,
    required this.date,
    required this.time,
    required this.name,
    required this.status,
    required this.id,
  });

  @override
  State<UpcomingAppointment> createState() => _UpcomingAppointmentState();
}

class _UpcomingAppointmentState extends State<UpcomingAppointment> {
  String updatedStatus = '';

  void onStatusChange(String? value) {
    int status = int.tryParse(value.toString()) ?? -1;
    if (status == -1) {
      return;
    }

    updateAppointment(widget.id.toString(), status).then((resp) {
      if (resp['success']) {
        updatedStatus = status.toString();
        setState(() {
          updatedStatus = status.toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.date, style: TextStyle(fontSize: 11.sp)),
                SizedBox(
                  height: 10.h,
                ),
                Text(widget.name,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.time,
                    style: TextStyle(
                      fontSize: 11.sp,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: '0',
                      child: Container(
                        child: const Text(
                          "Pending",
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 247, 132, 8),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '1',
                      child: Container(
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Container(
                        child: const Text(
                          "Rejected",
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                      ),
                    ),
                  ],
                  onChanged: onStatusChange,
                  value: (updatedStatus == '') ? widget.status : updatedStatus,
                )
              ],
            )
          ],
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}

class Invoice extends StatefulWidget {
  final String invoice;
  final String name;
  final String date;
  final BillingModel bill;
  const Invoice(
      {super.key,
      required this.invoice,
      required this.name,
      required this.date,
      required this.bill});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
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
              widget.date,
              style: TextStyle(color: AppColors.darkTextColor, fontSize: 11.sp),
            ),
            Text(
              "Invoice No: #${widget.invoice}",
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
              onTap: () async {
                final pdfFile = await PdfInvoiceApi.generateBill(widget.bill);
                PdfApi.openFile(pdfFile);
              },
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
                    "Invoice",
                    style: TextStyle(
                        color: AppColors.iconDarkColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
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

class PastAppointment extends StatefulWidget {
  final String invoice;
  final String name;
  final String date;
  const PastAppointment({
    super.key,
    required this.invoice,
    required this.name,
    required this.date,
  });

  @override
  State<PastAppointment> createState() => _PastAppointmentState();
}

class _PastAppointmentState extends State<PastAppointment> {
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
              widget.date,
              style: TextStyle(color: AppColors.darkTextColor, fontSize: 11.sp),
            ),
            Text(
              "Invoice No: #${widget.invoice}",
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
            // GestureDetector(
            //   onTap: () async {
            //     final pdfFile = await PdfInvoiceApi.generate(widget.bill);
            //     PdfApi.openFile(pdfFile);
            //   },
            //   child: Wrap(
            //     alignment: WrapAlignment.center,
            //     crossAxisAlignment: WrapCrossAlignment.center,
            //     children: [
            //       SvgPicture.asset(
            //         "assets/icons/download.svg",
            //         color: AppColors.iconDarkColor,
            //       ),
            //       SizedBox(
            //         width: 7.w,
            //       ),
            //       Text(
            //         "Invoice",
            //         style: TextStyle(
            //             color: AppColors.iconDarkColor,
            //             fontSize: 14.sp,
            //             fontWeight: FontWeight.w500),
            //       )
            //     ],
            //   ),
            // )
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
