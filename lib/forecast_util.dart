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

  static getIcons(IconData iconData1, IconData iconData2) {
    return Column(
      children: [
        Icon(iconData1, color: Colors.white),
        SizedBox(height: 10),
        Icon(iconData2, color: Colors.white),
      ],
    );
  }

  static getValues(int value1, String units1, int value2, String units2) {
    return Column(
      children: [
        Row(
          children: [
            Text('  $value1', style: TextStyle(color: Colors.grey)),
            Text('$units1', style: TextStyle(color: Colors.grey)),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Text('  $value2', style: TextStyle(color: Colors.grey)),
            Text('$units2', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
