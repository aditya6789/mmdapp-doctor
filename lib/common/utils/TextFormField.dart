import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DateTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  const DateTextFormField({super.key, this.controller});

  @override
  State<DateTextFormField> createState() => _DateTextFormFieldState();
}

class _DateTextFormFieldState extends State<DateTextFormField> {
  @override
  void initState() {
    widget.controller?.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.date_range),
          hintStyle: TextStyle(fontSize: 11.sp),
          hintText:
              "${DateFormat('dd/MM/yyyy').format(DateTime.now())} (Current Date)"),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          setState(() {
            widget.controller?.text =
                formattedDate; //set output date to TextField value.
          });
        } else {}
      },
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  const CustomTextFormField({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Enter",
        hintStyle: TextStyle(fontSize: 11.sp),
      ),
    );
  }
}

class BirthTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  const BirthTextFormField({super.key, this.controller});

  @override
  State<BirthTextFormField> createState() => _BirthTextFormFieldState();
}

class _BirthTextFormFieldState extends State<BirthTextFormField> {
  @override
  void initState() {
    widget.controller?.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "dd/mm/yyyy",
        hintStyle: TextStyle(fontSize: 11.sp),
        suffixIcon: Icon(Icons.date_range),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          setState(() {
            widget.controller?.text =
                formattedDate; //set output date to TextField value.
          });
        } else {}
      },
    );
  }
}

class TimeTextFormField extends StatefulWidget {
  final TextEditingController controller;

  TimeTextFormField({super.key, required this.controller});

  @override
  State<TimeTextFormField> createState() => _TimeTextFormFieldState();
}

class _TimeTextFormFieldState extends State<TimeTextFormField> {
  @override
  void initState() {
    widget.controller.text = ""; //set the initial value of text field
    super.initState();
  }

  TimeOfDay _currentTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "hh:mm",
        hintStyle: TextStyle(fontSize: 11.sp),
        suffixIcon: const Icon(Icons.timer_sharp),
      ),
      onTap: () async {
        TimeOfDay? pickedTime =
            await showTimePicker(context: context, initialTime: _currentTime);

        if (pickedTime != null) {
          print(pickedTime.format(context)); //output 10:51 PM
          DateTime parsedTime =
              DateFormat.jm().parse(pickedTime.format(context).toString());
          //converting to DateTime so that we can further format on different pattern.
          print(parsedTime); //output 1970-01-01 22:53:00.000
          String formattedTime = DateFormat('HH:mm').format(parsedTime);
          print(formattedTime); //output 14:59:00
          //DateFormat() is from intl package, you can format the time on any pattern you need.

          setState(() {
            widget.controller.text =
                formattedTime; //set the value of text field.
          });
        } else {
          // print("Time is not selected");
        }
      },
    );
  }
}
