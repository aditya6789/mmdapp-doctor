import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/homeModel.dart';

class PatientsController extends GetxController {
  var patientsDetails = Rxn<PatientsModel>();

  fetchPatientsDetails(String id) {
    patientsDetails.value = PatientsModel(title: [
      "Total Patients",
      "Today's Patients",
      "Appointments"
    ], img: [
      "assets/icons/total.svg",
      "assets/icons/today.svg",
      "assets/icons/appointment_component.svg"
    ], day: [
      "Till Today",
      "14 , Jan 2020",
      "15 , Jan 2020",
      "Appointments"
    ], number: [
      1500,
      25,
      80
    ]);
  }
}

class TodayController extends GetxController {
  var todayDetails = Rxn<TodaysModel>();

  fetchTodayDetails(String id) {
    todayDetails.value = TodaysModel(name: [
      "Aditya Paswan",
      "Anurag Shakya",
      "Nihal Sharma",
    ], date: [
      "12/10/2020",
      "15/10/2020",
      "18/10/2020",
    ], type: [
      "New Patient",
      "Old Patient",
      "New Patient",
    ], time: [
      '@10:00AM',
      '@11:00AM',
      '@12:00AM',
    ]);
  }
}
