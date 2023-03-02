import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mmdapp_doctor/components/searchCustomerComponent.dart';

import '../common/utils/TextFormField.dart';
import '../common/utils/customButton.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController dobDate = TextEditingController();
  TextEditingController customer_name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  void submitHandler() async {
    Map userData = {
      "first_name": customer_name.value.text,
      "email": email.value.text,
      "mobile": mobile.value.text,
      "address_line1": address.value.text,
      "note": note.value.text,
      "customer": null
    };

    print(userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
        title: Text(
          "Add Customer",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SearchCustomer(controller: TextEditingController()),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                DateTextFormField(
                  controller: dateInput,
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
                  "Customer Name",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                CustomTextFormField(
                  controller: customer_name,
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
                  "Moblie Number",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                CustomTextFormField(
                  controller: mobile,
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
                  "Email Id",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                CustomTextFormField(
                  controller: email,
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
                  "Date of Birth",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                BirthTextFormField(
                  controller: dobDate,
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
                  "Address",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                CustomTextFormField(
                  controller: address,
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
                  "Additional Notes",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                CustomTextFormField(
                  controller: note,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButtonOutline(
                    onPressed: () {},
                    text: "Reset",
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: submitHandler,
                    text: "Save",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
