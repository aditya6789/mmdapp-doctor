import 'package:flutter/material.dart';

//get truncated string
String getTruncatedString(String str) {
  if (str.length > 30) {
    return str.substring(0, 15) + '...';
  } else {
    return str;
  }
}

Widget successToast(String msg) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text(getTruncatedString(msg)),
      ],
    ),
  );
}

Widget errorToast(String msg) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Color.fromARGB(255, 255, 99, 99),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error),
        SizedBox(
          width: 12.0,
        ),
        Text(
          getTruncatedString(msg),
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}
