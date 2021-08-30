import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melancholy_meter/repository/wellcome_repository.dart';
import 'package:melancholy_meter/ui/detail_page/page/detail_page.dart';
import 'package:melancholy_meter/ui/insert_page/page/insert_page.dart';
import 'package:melancholy_meter/ui/wellcome_page/page_module/maxim_module.dart';
import 'package:melancholy_meter/view_model/wellcome_page_view_model.dart';

class WellComePage extends StatelessWidget {
  final repository = MaximRepository();

  @override
  Widget build(BuildContext context) {
    final pageController = Get.put(WellComePageViewModel(repository));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/main_background.jpeg'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              titleText(),
              SizedBox(height: 16.0),
              MaximModule(getXController: pageController),
              SizedBox(height: 8),
              nextIcon(pageController),
            ],
          ),
        ),
      ),
    );
  }

  InkWell nextIcon(WellComePageViewModel pageController) {
    return InkWell(
      onTap: () {
        if (pageController.isWrite.isTrue) {
          Get.off(InsertPage());
        } else
          Get.off(DetailPage());
      },
      child: Icon(
        Icons.not_started_outlined,
        size: 60,
        color: Colors.white,
      ),
    );
  }

  Text titleText() {
    return Text(
      '우울 미터기',
      style: TextStyle(
          color: Colors.white54,
          fontSize: 36,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline),
    );
  }
}
