import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleDay extends StatefulWidget {
  final String day;
  CircleDay({super.key, required this.day});

  @override
  State<CircleDay> createState() => _CircleDayState();
}

class _CircleDayState extends State<CircleDay> {
  bool _hasBeenPressed = false;
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("clicked");
        setState(() {
          _hasBeenPressed = !_hasBeenPressed;
          _currentIndex = 0;
        });
      },
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: _hasBeenPressed ? Colors.blue : Colors.white,
            border: _hasBeenPressed
                ? Border.all(color: Colors.blue)
                : Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: Text(
            widget.day,
            style: TextStyle(
                fontSize: 14.sp,
                color: _hasBeenPressed ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
