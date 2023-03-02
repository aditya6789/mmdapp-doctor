import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmdapp_doctor/services/auth/doctorService.dart';

import '../models/customerModel.dart';

class CustomerController extends GetxController {
  var customerDetails = Rxn<List<CustomerModel>>();

  fetchCustomerDetails(String id) async {
    Map<String, dynamic> data = await getQueueCustomers();
    if (data['data'] != null) {
      var records = data['data'];
      List<CustomerModel> customerData = [];

      for (int i = 0; i < records.length; i++) {
        CustomerModel doctorData = CustomerModel.fromJson(records[i]);
        customerData.add(doctorData);
      }
      customerDetails.value = customerData;
    } else {
      customerDetails.value = [];
    }
  }
}
