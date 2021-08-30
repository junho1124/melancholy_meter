import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melancholy_meter/ui/detail_page/page/detail_page.dart';
import 'package:melancholy_meter/view_model/main_page_view_model.dart';

class NoteOfTheDayModule extends StatelessWidget {
  const NoteOfTheDayModule({
    Key? key,
    required TextEditingController textController,
    required MainPageViewModel getXController
  })  : _textController = textController,
        _controller = getXController,
        super(key: key);

  final TextEditingController _textController;

  final MainPageViewModel _controller;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text('기분 메모장'),
        SizedBox(
          height: 16.0,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.2),
                    blurRadius: 1.0)
              ]),
          height: 230,
          child: TextField(
            controller: _textController,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        TextButton(
            onPressed: () {
              _controller.saveStatus(_textController.text);
              // _controller.saveFake();
              Get.off(DetailPage());
            },
            child: Text(
              '저장',
              style: TextStyle(fontSize: 24.0, color: Colors.deepPurple),
            ))
      ],
    );
  }
}