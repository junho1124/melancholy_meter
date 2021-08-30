import 'package:flutter/material.dart';
import 'package:melancholy_meter/view_model/main_page_view_model.dart';
import 'package:get/get.dart';

import '../make_face_icon.dart';

class ChooseIconModule extends StatelessWidget {
  const ChooseIconModule({
    Key? key,
    required MainPageViewModel getXController
  }) : _controller = getXController,
        super(key: key);

  final MainPageViewModel _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.deepPurple.shade200,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '선택 해 주세요',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),
          ),
          SizedBox(height: 8.0,),
          Container(
            height: 40,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return makeFaceIcon(_controller, index.obs);
              },
            ),
          ),
        ],
      ),
    );
  }
}