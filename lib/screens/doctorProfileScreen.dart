import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mmdapp_doctor/common/utils/global_variable.dart';
import 'package:mmdapp_doctor/services/auth/doctorServices.dart';
import 'package:mmdapp_doctor/utils/customToasts.dart';

import '../components/doctor_profile_screen_component.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  FToast fToast = FToast();
  Map profileData = {};

  @override
  void initState() {
    super.initState();
    getProfileData().then((value) {
      if (value['success'] == false) {
        fToast.showToast(child: errorToast('Something Went Wrong'));
        return;
      } else {
        print(value['data']);
        setState(() {
          profileData = value['data'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.mainColorbutton,
            )),
        title: const Text(
          "Profile",
          style: TextStyle(color: AppColors.mainColorbutton),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        // image: DecorationImage(image: AssetImage("assets/dummy_image.png"))
                        color: Colors.blue),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 50.w,
                        height: 20.h,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          color: Colors.black38,
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.camera,
                          size: 10,
                        )),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text(
                            profileData['first_name'] ?? '[First Name]',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mainColorbutton),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Icon(
                            Icons.verified,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      Text(
                        profileData['mobile'].toString() ?? '[mobile]',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const DoctorProfileComponent()
            ],
          ),
        )),
      ),
    );
  }
}
