import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mmdapp_doctor/services/auth/doctorServices.dart';
import 'package:mmdapp_doctor/utils/customToasts.dart';

class DoctorProfileComponent extends StatefulWidget {
  const DoctorProfileComponent({super.key});

  @override
  State<DoctorProfileComponent> createState() => _DoctorProfileComponentState();
}

class _DoctorProfileComponentState extends State<DoctorProfileComponent> {
  FilePickerResult? result;
  PlatformFile? pickedFile;
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController clinicRegistrationController = TextEditingController();

  FToast fToast = FToast();

  Map profileData = {};

  @override
  void initState() {
    super.initState();
    getProfileData().then((value) {
      print(value);
      if (value['success'] == false) {
        fToast.showToast(child: errorToast('Something Went Wrong'));
        return;
      } else {
        print(value['data']);
        setState(() {
          profileData = value['data'];
          updateFields(value['data']);
        });
      }
    });
  }

  //update fields by profile data
  void updateFields(Map profileData) {
    emailController.text = profileData['email'] ?? 'email';
    genderController.text = profileData['gender'] ?? 'gender';
    // emailController.text = profileData['email'] ?? 'email';
    // emailController.text = profileData['email'] ?? 'email';
    // emailController.text = profileData['email'] ?? 'email';
  }

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      setState(() {
        isLoading = false;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Email Id",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            SizedBox(
              width: 150.w,
              child: Container(
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText: "pasdtyhjk@gmail.com",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 149, 148, 148)),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Gender",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 149, 148, 148)),
            ),
            SizedBox(
              width: 130.w,
              child: Container(
                child: TextFormField(
                  controller: genderController,
                  decoration: const InputDecoration(
                      hintText: "Male",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 149, 148, 148)),
                      hintTextDirection: TextDirection.rtl,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        SizedBox(
          height: 10.h,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     const Text(
        //       "Date Of Birth",
        //       style: TextStyle(
        //           fontWeight: FontWeight.w500,
        //           color: Color.fromARGB(255, 149, 148, 148)),
        //     ),
        //     SizedBox(
        //       width: 130.w,
        //       child: Container(
        //         child: TextFormField(
        //           controller: dateController,
        //           decoration: const InputDecoration(
        //               hintText: "15-08-2003",
        //               hintStyle: TextStyle(
        //                   fontWeight: FontWeight.w500,
        //                   color: Color.fromARGB(255, 149, 148, 148)),
        //               hintTextDirection: TextDirection.rtl,
        //               disabledBorder: InputBorder.none,
        //               enabledBorder: InputBorder.none,
        //               focusedBorder: InputBorder.none),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        // SizedBox(
        //   height: 10.h,
        // ),
        // const Divider(
        //   thickness: 1,
        //   height: 1,
        // ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Doctor Registration No",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            SizedBox(
              width: 130.w,
              child: Container(
                child: TextFormField(
                  controller: registrationController,
                  decoration: const InputDecoration(
                      hintText: "Enter",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 149, 148, 148)),
                      hintTextDirection: TextDirection.rtl,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Clinic Address",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 149, 148, 148)),
            ),
            SizedBox(
              width: 130.w,
              child: Container(
                child: TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                      hintText: "Enter",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 149, 148, 148)),
                      hintTextDirection: TextDirection.rtl,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Clinic Registration No",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            SizedBox(
              width: 130.w,
              child: Container(
                child: TextFormField(
                  controller: clinicRegistrationController,
                  decoration: const InputDecoration(
                      hintText: "Enter",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 130, 130, 130)),
                      hintTextDirection: TextDirection.rtl,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Agreement File",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            GestureDetector(
              onTap: () {
                pickFile();
              },
              child: Container(
                width: 120.w,
                height: 20.h,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black38,
                  width: 1,
                )),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud_upload,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Upload File",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Degree Certificate",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            GestureDetector(
              onTap: () {
                pickFile();
              },
              child: Container(
                width: 120.w,
                height: 20.h,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black38,
                  width: 1,
                )),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud_upload,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Upload File",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Clinic Address Proof",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            GestureDetector(
              onTap: () {
                pickFile();
              },
              child: Container(
                width: 120.w,
                height: 20.h,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black38,
                  width: 1,
                )),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud_upload,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Upload File",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Your Sign",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            GestureDetector(
              onTap: () {
                pickFile();
              },
              child: Container(
                width: 120.w,
                height: 20.h,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black38,
                  width: 1,
                )),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud_upload,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Upload File",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }
}
