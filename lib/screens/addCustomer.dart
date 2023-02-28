import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../common/utils/TextFormField.dart';
import '../common/utils/customButton.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
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
          "Add Customer",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Container(
            //   height: 60,
            //   decoration: BoxDecoration(
            //       border:
            //           Border(bottom: BorderSide(color: Colors.black, width: 2))),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: TextFormField(
            //         controller: dateInput,
            //         decoration:
            //             InputDecoration(suffixIcon: Icon(Icons.macro_off)),
            //         onTap: () async {
            //           DateTime? pickedDate = await showDatePicker(
            //               context: context,
            //               initialDate: DateTime.now(),
            //               firstDate: DateTime(1950),
            //               //DateTime.now() - not to allow to choose before today.
            //               lastDate: DateTime(2100));

            //           if (pickedDate != null) {
            //             print(
            //                 pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
            //             String formattedDate =
            //                 DateFormat('yyyy-MM-dd').format(pickedDate);
            //             print(
            //                 formattedDate); //formatted date output using intl package =>  2021-03-16
            //             setState(() {
            //               dateInput.text =
            //                   formattedDate; //set output date to TextField value.
            //             });
            //           } else {}
            //         },
            //       )),
            //     ],
            //   ),
            // )

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                DateTextFormField(),
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
                CustomTextFormField(),
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
                CustomTextFormField(),
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
                CustomTextFormField(),
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
                BirthTextFormField(),
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
                CustomTextFormField(),
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
                CustomTextFormField(),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {},
                    text: "Save",
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: () {},
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
