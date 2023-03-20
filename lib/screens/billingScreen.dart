import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mmdapp_doctor/common/utils/TextFormField.dart';
import 'package:mmdapp_doctor/common/utils/global_variable.dart';
import 'package:mmdapp_doctor/components/searchCustomerComponent.dart';
import 'package:mmdapp_doctor/services/auth/doctorServices.dart';
import 'package:mmdapp_doctor/utils/api_utils.dart';
import 'package:mmdapp_doctor/utils/customToasts.dart';

import '../common/utils/customButton.dart';
import '../components/appointmentsComponents.dart';
import '../models/billingModel.dart';

class BillingScreen extends StatefulWidget {
  static const String routeName = 'billing';
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  TextEditingController appointmentDate = TextEditingController();
  TextEditingController customerId = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController consultationCharges = TextEditingController();
  FToast fToast = FToast();

  List<BillingModel> billing = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBills().then((bills) {
      billing = bills;
      setState(() {});
    });
    fToast.init(context);
  }

  Future<List<BillingModel>> getBills() async {
    var resp = await listBillings();

    if (resp.containsKey('success')) {
      bool success = resp['success'];
      if (success) {
        var data = resp['data'];
        List<BillingModel> prescs = [];

        for (var i = 0; i < data.length; i++) {
          var bill = data[i];
          BillingModel presc = BillingModel.fromJson(bill);
          prescs.add(presc);
        }
        return prescs;
      } else {
        if (resp.containsKey('message')) {
          fToast.showToast(child: errorToast(resp['message']));
          return [];
        }
      }
    } else {
      fToast.showToast(child: errorToast("Something Went Wrong"));
      return [];
    }

    fToast.showToast(child: errorToast('Something Went Wrong'));
    return [];
  }

  void submitHandler() {
    //Api call

    Map billingData = {
      'consultationCharges': consultationCharges.value.text,
      'appointmentDate':
          appointmentDate.value.text.split('/').reversed.join('-'),
      'customer': customerId.value.text,
      'mobileNo': mobileNo.value.text,
    };

    // apicall
    createBilling(billingData).then((resp) {
      if (resp['success']) {
        fToast.showToast(child: successToast("Billing Successfully Created"));
      } else {
        fToast.showToast(child: errorToast(resp['message']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            toolbarHeight: 80,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.mainColorbutton,
                )),
            title: const Text(
              "Billing",
              style: TextStyle(color: AppColors.mainColorbutton),
            ),
            bottom: TabBar(
                onTap: (value) => {
                      if (value == 1)
                        {
                          getBills().then((bills) {
                            billing = bills;
                            setState(() {});
                          })
                        }
                    },
                unselectedLabelColor: Colors.black,
                labelColor: AppColors.mainColorbutton,
                indicatorColor: AppColors.mainColorbutton,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: Text(
                      "Add New Bill",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: Text(
                      "All Bills",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ]),
            backgroundColor: Colors.white,
            elevation: 1,
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: const BoxConstraints(),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Appointment Date",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          BirthTextFormField(
                            controller: appointmentDate,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SearchCustomer(controller: customerId),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Customer Moblie Number",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            controller: mobileNo,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Billing Date",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextField(
                            controller: TextEditingController(
                                text: DateTime.now()
                                    .toString()
                                    .split(' ')[0]
                                    .split('-')
                                    .reversed
                                    .join('/')),
                            enabled: false,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Consultation Charges",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            controller: consultationCharges,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: CustomButtonOutline(
                                    onPressed: () {}, text: "Clear")),
                            SizedBox(
                              width: 30.w,
                            ),
                            Expanded(
                                child: CustomButton(
                                    onPressed: submitHandler, text: "Save"))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: (false ?? false)
                  ? Center(
                      child: Text("No Bill's"),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) => Invoice(
                          bill: billing[index],
                          invoice: billing[index].id.toString(),
                          date: billing[index].billingDate.toString(),
                          name: billing[index]
                                  .customerData
                                  ?.fullName
                                  .toString() ??
                              ''),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: billing.length),
            )
          ])),
    );
  }
}
