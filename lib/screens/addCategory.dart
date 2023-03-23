import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmdapp_doctor/landing.dart';
import 'package:mmdapp_doctor/services/auth/doctorServices.dart';

class AddDoctorTagScreen extends StatefulWidget {
  List<dynamic> tags;
  List<dynamic> remainingTags;

  AddDoctorTagScreen(
      {super.key, required this.remainingTags, required this.tags});

  @override
  State<AddDoctorTagScreen> createState() => _AddDoctorTagScreenState();
}

class _AddDoctorTagScreenState extends State<AddDoctorTagScreen> {
  List<String> _selectedCategories = [];
  List<dynamic> _categories = [];

  @override
  void initState() {
    super.initState();
    setInitState();
  }

  void setInitState() {
    _selectedCategories = widget.tags.map((e) => e['id'].toString()).toList();
    _categories = widget.remainingTags + widget.tags;
    print(_selectedCategories);

    print(widget.tags);
    setState(() {});
  }

  void onClick(String id) {
    if (_selectedCategories.contains(id)) {
      _selectedCategories.remove(id);
      addDoctorTags(id, true).then((value) {
        if (value['success'] == true) {
          // Get.to(const LandingScreen(subRoute: 'home'));
        } else {
          if (value.containsKey('message')) {
            Get.snackbar('Error', value['message']);
          } else {
            Get.snackbar('Error', 'Something went wrong');
          }
        }
      });
    } else {
      _selectedCategories.add(id);
      addDoctorTags(id, false).then((value) {
        if (value['success'] == true) {
          // Get.to(const LandingScreen(subRoute: 'home'));
        } else {
          if (value.containsKey('message')) {
            Get.snackbar('Error', value['message']);
          } else {
            Get.snackbar('Error', 'Something went wrong');
          }
        }
      });
    }

    setState(() {
      print(_selectedCategories);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Select Categories",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Wrap(
                          spacing: 5,
                          direction: Axis.horizontal,
                          children: List.generate(
                            _categories.length,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  onClick(_categories[index]["id"].toString());
                                },
                                child: Container(
                                  height: 30.h,
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: _selectedCategories.contains(
                                              _categories[index]["id"]
                                                  .toString())
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(
                                          color: _selectedCategories.contains(
                                                  _categories[index]["id"]
                                                      .toString())
                                              ? Colors.blue
                                              : Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(_categories[index]["tag"],
                                      style: TextStyle(
                                          color: _selectedCategories.contains(
                                                  _categories[index]["id"]
                                                      .toString())
                                              ? Colors.white
                                              : Colors.black)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 17, 126, 251))),
                            onPressed: () {
                              Get.to(const LandingScreen(subRoute: 'home'));
                            },
                            child: const Text("Save"),
                          ),
                        ),
                      ],
                    )
                  ],
                ))) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
