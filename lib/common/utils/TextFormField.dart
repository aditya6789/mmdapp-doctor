import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DateTextFormField extends StatefulWidget {
  const DateTextFormField({super.key});

  @override
  State<DateTextFormField> createState() => _DateTextFormFieldState();
}

class _DateTextFormFieldState extends State<DateTextFormField> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateInput,
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.macro_off),
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
            dateInput.text =
                formattedDate; //set output date to TextField value.
          });
        } else {}
      },
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
  const BirthTextFormField({super.key});

  @override
  State<BirthTextFormField> createState() => _BirthTextFormFieldState();
}

class _BirthTextFormFieldState extends State<BirthTextFormField> {
  TextEditingController birthInput = TextEditingController();

  @override
  void initState() {
    birthInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: birthInput,
      decoration: InputDecoration(
        hintText: "dd/mm/yyyy",
        hintStyle: TextStyle(fontSize: 11.sp),
        suffixIcon: Icon(Icons.macro_off),
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
            birthInput.text =
                formattedDate; //set output date to TextField value.
          });
        } else {}
      },
    );
  }
}
