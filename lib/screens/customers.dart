import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmdapp_doctor/components/components.dart';

class Customers extends StatelessWidget {
  const Customers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
        title: const Text(
          "Customers",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => CustomersComponent(
                          date: "25/12/2021",
                          name: "Aditya Paswan",
                          number: "98767897656",
                          visit: "20",
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    itemCount: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
