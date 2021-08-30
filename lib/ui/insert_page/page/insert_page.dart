import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melancholy_meter/repository/status_repository.dart';
import 'package:melancholy_meter/ui/insert_page/page_module/choose_icon_module.dart';
import 'package:melancholy_meter/ui/insert_page/page_module/note_of_the_day_module.dart';
import 'package:melancholy_meter/ui/insert_page/page_module/state_indicator_module.dart';
import 'package:melancholy_meter/view_model/main_page_view_model.dart';

class InsertPage extends StatelessWidget {
  final _textController = TextEditingController();
  final _repository = StatusRepository();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainPageViewModel(_repository));
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


