import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melancholy_meter/repository/status_repository.dart';
import 'package:melancholy_meter/ui/detail_page/page/detail_page.dart';
import 'package:melancholy_meter/ui/main_page/page_module/state_indicator_module.dart';
import 'package:melancholy_meter/view_model/main_page_view_model.dart';
import 'package:melancholy_meter/ui/main_page/page_module/choose_icon_module.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final repository = StatusRepository();
    final controller = Get.put(MainPageViewModel(repository));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '오늘의 기분',
          style: TextStyle(fontSize: 26),
        ),
        leading: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChooseIconModule(getXController: controller),
              SizedBox(height: 16.0),
              StateIndicatorModule(getXController: controller),
              SizedBox(height: 16.0),
              Divider(color: Colors.black),
              SizedBox(height: 16.0),
              NoteOfTheDayModule(textController: _textController, getXController: controller)
            ],
          ),
        ),
      ),
    );
  }
}

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
