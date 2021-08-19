import 'package:flutter/material.dart';



Color selectedIconColor(int index) {
  switch(index) {
    case 0:
      return Colors.red;
    case 1:
      return Colors.orange;
    case 2:
      return Colors.black45;
    case 3:
      return Colors.lightGreen;
    case 4:
      return Colors.green;
    default:
      return Colors.black;
  }
}

