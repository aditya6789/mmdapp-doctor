import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mmdapp_doctor/screens/appointmentsScreen.dart';
import 'package:mmdapp_doctor/screens/billingScreen.dart';
import 'package:mmdapp_doctor/screens/homeScreen.dart';
import 'package:mmdapp_doctor/screens/prescriptionScreen.dart';
import 'package:mmdapp_doctor/screens/addScheduleScreen.dart';

import 'common/utils/global_variable.dart';

class LandingScreen extends StatefulWidget {
  final String subRoute;
  static const String routeName = '/landing/';
  const LandingScreen({Key? key, required this.subRoute}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  PageController _pageController = PageController();
  List<Widget> _screen = [
    HomeScreen(),
    AppointmentsScreen(),
    PrescriptionScreen(),
    AddScheduleScreen(),
    BillingScreen(),
  ];
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        physics: NeverScrollableScrollPhysics(),
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
          backgroundColor: Color.fromARGB(255, 240, 239, 239),
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
          unselectedLabelStyle: TextStyle(
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
