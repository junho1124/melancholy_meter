import 'package:flutter/material.dart';
import 'package:melancholy_meter/util/selected_icon_color.dart';
import 'package:melancholy_meter/util/selected_status_text.dart';
import 'package:melancholy_meter/view_model/main_page_view_model.dart';
import 'package:provider/provider.dart';

class StateIndicatorModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final watchViewModel = context.watch<MainPageViewModel>();
    return Column(
      children: [
        Icon(
          Icons.tag_faces,
          size: 200,
          color: selectedIconColor(watchViewModel.selected),),
        Text(
          selectedStatusText(watchViewModel.selected),
          style: TextStyle(
              fontSize: 24,
              color: selectedIconColor(watchViewModel.selected)
          ),
        )
      ],
    );
  }
}
