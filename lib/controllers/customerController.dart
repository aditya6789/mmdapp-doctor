import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/customerModel.dart';

class CustomerController extends GetxController {
  var customerDetails = Rxn<CustomerModel>();

  fetchCustomerDetails(String id) {
    customerDetails.value = CustomerModel(name: [
      "Aditya Paswan",
      "Anurag Shakya",
      "Nihal Sharma",
    ], date: [
      "12/10/2020",
      "15/10/2020",
      "18/10/2020",
    ], number: [
      "87654356789",
      "7654356789",
      "8765435678",
    ], time: [
      '@10:00AM',
      '@11:00AM',
      '@12:00AM',
    ], total: [
      5,
      8,
      10
    ]);
  }
}
