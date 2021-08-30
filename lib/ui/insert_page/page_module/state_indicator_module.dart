import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melancholy_meter/util/selected_icon_color.dart';
import 'package:melancholy_meter/util/selected_status_text.dart';
import 'package:melancholy_meter/view_model/main_page_view_model.dart';

class StateIndicatorModule extends StatelessWidget {
  const StateIndicatorModule({
    Key? key,
    required MainPageViewModel getXController
  }) : _controller = getXController,
        super(key: key);

  final MainPageViewModel _controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        Icon(
          Icons.tag_faces,
          size: 200,
          color: selectedIconColor(_controller.selected.value),),
        Text(
          selectedStatusText(_controller.selected.value),
          style: TextStyle(
              fontSize: 24,
              color: selectedIconColor(_controller.selected.value)
          ),
        )
      ],
    )
    );
  }
}
