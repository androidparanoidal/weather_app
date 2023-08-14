import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormatedDate(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }

  static String getHoursData(DateTime dateTime) {
    return DateFormat.Hm().format(dateTime);
  }

  static getItem(
      IconData iconData, int value, String units, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(iconData, color: Colors.white),
            Text('  $value', style: TextStyle(color: Colors.grey)),
            Text('$units', style: TextStyle(color: Colors.grey)),
          ],
        ),
        Text('$description', style: TextStyle(color: Colors.white))
      ],
    );
  }
}
