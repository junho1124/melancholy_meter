import 'package:flutter/material.dart';
import 'package:melancholy_meter/repository/detail_repository.dart';
import 'package:melancholy_meter/ui/detail_page/page_module/monthly_chart.dart';
import 'package:melancholy_meter/ui/detail_page/page_module/status_now.dart';
import 'package:melancholy_meter/ui/detail_page/page_module/weekly_chart.dart';
import 'package:melancholy_meter/ui/diary_page/page/diary_page.dart';
import 'package:melancholy_meter/view_model/detail_page_view_model.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final repository = DetailRepository();
    final controller = Get.put(DetailPageViewMode(repository));
    return Scaffold(
        appBar: AppBar(
          title: Text('내 기분'),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(DiaryPage());
                },
                icon: Icon(Icons.list_alt)),
            IconButton(
                onPressed: () {
                  controller.buttonChange();
                },
                icon: Obx(() => controller.isButtonChange.value
                    ? Icon(Icons.bar_chart)
                    : Icon(Icons.show_chart))
            )
          ],
        ),
        body: controller.isLoaded
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 16.0),
                    StatusNow(getXController: controller),
                    SizedBox(height: 16.0),
                    Divider(color: Colors.black),
                    SizedBox(height: 16.0),
                    Obx(() => controller.isButtonChange.value ? MonthlyChart(getXController: controller) : WeeklyChart(getXController: controller))
                    // TextButton(onPressed: () {
                    //   viewModel.clearStatus();
                    // }, child: Text('초기화'))
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
