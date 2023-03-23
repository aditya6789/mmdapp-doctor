import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mmdapp_doctor/screens/addCategory.dart';
import 'package:mmdapp_doctor/screens/appointmentsScreen.dart';
import 'package:mmdapp_doctor/screens/billingScreen.dart';
import 'package:mmdapp_doctor/screens/homeScreen.dart';
import 'package:mmdapp_doctor/screens/loginScreen.dart';
import 'package:mmdapp_doctor/screens/prescriptionScreen.dart';
import 'package:mmdapp_doctor/screens/addScheduleScreen.dart';
import 'package:mmdapp_doctor/services/auth/doctorServices.dart';
import 'package:mmdapp_doctor/utils/api_utils.dart';

import 'common/utils/global_variable.dart';

class LandingScreen extends StatefulWidget {
  final String subRoute;
  static const String routeName = '/landing/';
  const LandingScreen({Key? key, required this.subRoute}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _pageController = PageController();
  final List<Widget> _screen = [
    const HomeScreen(),
    const AppointmentsScreen(),
    const PrescriptionScreen(),
    const AddScheduleScreen(),
    const BillingScreen(),
  ];

  List<String> screenRoutes = [
    HomeScreen.routeName,
    AppointmentsScreen.routeName,
    PrescriptionScreen.routeName,
    AddScheduleScreen.routeName,
    BillingScreen.routeName,
  ];

  List<Map> tags = [];
  List<Map> remainingTags = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLoginStatus();

    getDoctorTags().then((value) {
      if (value['success'] == true) {
        print(value);
        if (value.containsKey('data')) {
          if (value['data'].containsKey('tags')) {
            if (value['data']['tags'].length == 0) {
              Get.to(AddDoctorTagScreen(
                tags: value['data']['tags'],
                remainingTags: value['data']['remaining_tags'],
              ));
            }
          }
        }
      }
    });
  }

  void _checkLoginStatus() async {
    bool authenticated = await isUserAuthenticated();

    if (!authenticated) {
      Get.to(const LoginScreen());
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onLoad() {
    if (widget.subRoute != '') {
      int index = screenRoutes.indexOf(widget.subRoute);
      _pageController.jumpToPage(index);
    }
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          currentIndex: this._selectedIndex,
          selectedItemColor: AppColors.iconDarkColor,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          iconSize: 20,
          backgroundColor: const Color.fromARGB(255, 240, 239, 239),
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
          unselectedLabelStyle: const TextStyle(
              fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black),
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                  height: 20,
                  width: 20,
                ),
              ),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/appointment.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
                label: 'APPOINTMENT'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/prescription.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
                label: 'PRESCRIPTION'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/schedule.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
                label: 'SCHEDULE'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/billing.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
                label: 'BILLING'),
          ],
        ),
      ),
    );
  }
}
