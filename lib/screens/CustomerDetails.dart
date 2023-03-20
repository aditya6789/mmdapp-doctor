import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mmdapp_doctor/common/utils/global_variable.dart';
import 'package:mmdapp_doctor/components/prescriptionComponent.dart';
import 'package:mmdapp_doctor/services/auth/doctorServices.dart';
import 'package:mmdapp_doctor/utils/customToasts.dart';
import 'package:mmdapp_doctor/models/prescriptionModel.dart';

import '../common/utils/customButton.dart';
import '../common/utils/otpFormWidget.dart';

class CustomerDetails extends StatefulWidget {
  final String queueId;
  final String customerId;
  const CustomerDetails(
      {super.key, required this.queueId, required this.customerId});

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  Map customerData = {
    "id": 0,
    "customer": 0,
    "customer_name": "0",
    "email": "0@gmail.com",
    "mobile": 0,
    "note": "0",
    "status": 0,
    "deleted": false,
    "created_by": 0,
    "created_at": "0",
    "prescription_id": 0
  };

  List<PrescriptionModel> prescs = [];

  String details_status = 'has_access';
  FToast ftoast = FToast();

  @override
  void initState() {
    super.initState();
    ftoast.init(context);
    int queueId = int.tryParse(widget.queueId) ?? 0;

    getQueueDetails(queueId).then((resp) {
      if (resp['success']) {
        customerData = resp['data'];
        getCustomerDetails(widget.customerId).then((resp) {
          if (resp['success']) {
            if (resp.containsKey('data')) {
              details_status = resp['data']['status'];
              print("details status");
              print(resp);

              if (resp['data'].containsKey('patientData')) {
                var data = resp['data']['patientData']['prev_prescs'] ?? [];
                for (var i = 0; i < data.length; i++) {
                  var prescription = data[i];
                  PrescriptionModel presc =
                      PrescriptionModel.fromJson(prescription);
                  prescs.add(presc);
                }
              }
            }

            setState(() {});
          }
        });
        setState(() {});
      }
    });
  }

  void sendRequest() async {
    Map resp = await requestAccess(widget.customerId);
    if (resp['success']) {
      details_status = 'pending';
      ftoast.showToast(child: successToast("OTP Sent to the user"));
      setState(() {});
    } else {
      ftoast.showToast(child: errorToast("Something went wrong"));
    }
  }

  void verifyOtp(String otp) async {
    Map resp = await verifyRAOtp(widget.customerId, otp);
    if (resp['success']) {
      details_status = 'has_access';
      ftoast.showToast(child: successToast("Access Provided"));

      getCustomerDetails(widget.customerId).then((resp) {
        if (resp['success']) {
          if (resp.containsKey('data')) {
            details_status = resp['data']['status'];
            var data = resp['data']['patientData']['prescription_list'];

            for (var i = 0; i < data.length; i++) {
              var prescription = data[i];
              PrescriptionModel presc =
                  PrescriptionModel.fromJson(prescription);
              prescs.add(presc);
            }
          }

          setState(() {});
        }
      });

      setState(() {});
    } else {
      ftoast.showToast(child: errorToast("Something went wrong"));
    }
  }

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
          "Customer Details",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full Name",
                      style: TextStyle(
                          color: AppColors.mainColorbutton,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Moblie Number",
                      style: TextStyle(
                          color: AppColors.mainColorbutton,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                          color: AppColors.mainColorbutton,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Date of Birth",
                      style: TextStyle(
                          color: AppColors.mainColorbutton,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Address",
                      style: TextStyle(
                          color: AppColors.mainColorbutton,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerData['customer_name'].toString() ?? '',
                      style: TextStyle(
                          fontSize: 12.h, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      customerData['mobile'].toString() ?? '',
                      style: TextStyle(
                          fontSize: 12.h, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      customerData['email'].toString() ?? '',
                      style: TextStyle(
                          fontSize: 12.h, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "25-01-1992",
                      style: TextStyle(
                          fontSize: 12.h, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Apartment 1 Durga Park",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 12.h, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Column(
              children: [
                Text(
                  "Pervious Prescriptions",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainColorbutton),
                ),
                SizedBox(height: 30),
                ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) => Prescription(
                          date: prescs[index].createdAt?.split("T")[0] ?? '',
                          name: prescs[index].customerName ?? '',
                          presc: prescs[index],
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                    itemCount: prescs.length),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            if (details_status == 'no access')
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: CustomButton(
                  onPressed: () async {
                    sendRequest();
                  },
                  text: "Request Access",
                ),
              ),
            if (details_status == 'pending')
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: CustomButton(
                  onPressed: () {},
                  text: "Pending (Click to Send)",
                ),
              ),
            if (details_status == 'pending')
              Column(children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Enter the OTP",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainColorbutton),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Sent to the Patient Moblie Number",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: verifyOtp, // end onSubmit
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 140),
                  child: CustomButton(
                    onPressed: () {},
                    text: 'Submit',
                    width: 130,
                    height: 50,
                  ),
                )
              ]),
          ],
        ),
      ),
    );
  }
}
