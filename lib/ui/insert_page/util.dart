import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melancholy_meter/util/selected_icon_color.dart';
import 'package:melancholy_meter/view_model/main_page_view_model.dart';



  InkWell makeFaceIcon(MainPageViewModel controller, RxInt index) {
    return InkWell(
    onTap: () {
      controller.select(index.value);
      print(index);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.tag_faces,
        size: 44,
        color: selectedIconColor(index.value),
      ),
    ),
  );
  }
