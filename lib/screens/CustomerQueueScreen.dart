import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmdapp_doctor/components/components.dart';
import 'package:mmdapp_doctor/controllers/customerController.dart';

class CustomerQueueScreen extends StatelessWidget {
  const CustomerQueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customerController = Get.put((CustomerController()));

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
          "Customer In Queue",
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
              Expanded(
                child: FutureBuilder(
                    future: customerController.fetchCustomerDetails('1'),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                          itemCount:
                              (customerController.customerDetails.value) == null
                                  ? 0
                                  : customerController
                                      .customerDetails.value!.length,
                          itemBuilder: (context, index) {
                            return CustomerQueue(
                              date: customerController
                                  .customerDetails.value![index].date,
                              time: customerController
                                  .customerDetails.value![index].time,
                              name: customerController
                                  .customerDetails.value![index].name,
                              queueId: customerController
                                  .customerDetails.value![index].queueId,
                              customerId: customerController
                                  .customerDetails.value![index].customerId,
                            );
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
