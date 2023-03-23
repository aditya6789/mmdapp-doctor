import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmdapp_doctor/services/auth/doctorServices.dart';

import '../models/homeModel.dart';

class PatientsController extends GetxController {
  var patientsDetails = Rxn<PatientsModel>();

  fetchDashboardStats() async {
    Map resp = await getDashboardStats();
    if (resp['success'] == true) {
      Map respData = resp['data'];
      var todayPatients = respData['todays_patients'] ?? '';
      var totalPatients = respData['total_patients'] ?? '';
      var totalAppointments = respData['today_appointments'] ?? '';

      patientsDetails.value = PatientsModel(title: [
        "Total Patients",
        "Today's Patients",
        "Appointments"
      ], img: [
        "assets/icons/total.svg",
        "assets/icons/today.svg",
        "assets/Group 469.svg"
      ], day: [
        "Till Today",
        //currentDate in string format
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .toString()
            .substring(0, 10),
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .toString()
            .substring(0, 10),
      ], number: [
        totalPatients.toString(),
        todayPatients.toString(),
        totalAppointments.toString(),
      ]);
    }
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
