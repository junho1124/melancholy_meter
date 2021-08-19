import 'package:flutter/material.dart';
import 'package:melancholy_meter/util/selected_icon_color.dart';
import 'package:melancholy_meter/util/selected_status_text.dart';
import 'package:provider/provider.dart';
import 'package:melancholy_meter/view_model/detail_page_view_model.dart';

class StatusNow extends StatelessWidget {
  const StatusNow({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailPageViewMode>();
    return Container(
        child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.pinkAccent.shade100,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0
                  )
                ]),
            child: Center(
              child: Column(
                children: [
                  Text(
                    '오늘의 기분',
                    style: TextStyle(
                        fontSize: 24.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Icon(
                    Icons.tag_faces,
                    color: selectedIconColor(
                        int.parse(viewModel.outputNow[0])),
                    size: 100.0,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(selectedStatusText(
                      int.parse(viewModel.outputNow[0])))
                ],
              ),
            )));
  }
}