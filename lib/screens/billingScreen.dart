import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmdapp_doctor/common/utils/TextFormField.dart';
import 'package:mmdapp_doctor/common/utils/global_variable.dart';

import '../common/utils/customButton.dart';
import '../components/appointmentsComponents.dart';

class BillingScreen extends StatelessWidget {
  static const String routeName = 'billing';
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController chargesController = TextEditingController();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.mainColorbutton,
                )),
            title: Text(
              "Billing",
              style: TextStyle(color: AppColors.mainColorbutton),
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
            Padding(
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
                        controller: dateController,
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
                        "Customer Name",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextFormField(
                        controller: nameController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Wrap(children: [Icon(Icons.add), Text("Add New Customer")]),
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
                        controller: phoneController,
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
                      DateTextFormField(
                        controller: dateController,
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
                        "Consultation Charges",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextFormField(
                        controller: chargesController,
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
                            child: CustomButton(onPressed: () {}, text: "Save"))
                      ],
                    ),
                  )
                ],
              ),
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
          ])),
    );
  }
}
