import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:get/get.dart';
import 'package:melancholy_meter/view_model/wellcome_page_view_model.dart';

class MaximModule extends StatelessWidget {
  const MaximModule({
    Key? key,
    required this.getXController,
  }) : super(key: key);

  final WellComePageViewModel getXController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(16.0)),
      padding: EdgeInsets.all(8.0),
      width: 350,
      height: 150,
      child: Scrollbar(
        thickness: 3.0,
        child: Center(
          child: SingleChildScrollView(
            child: Obx(() => (getXController.maxim.value != '')
                ? FadeIn(
              duration: Duration(seconds: 3),
              curve: Curves.easeIn,
              child: Text(
                getXController.maxim.value,
                textAlign: TextAlign.center,
                style:
                TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            )
                : Container()),
          ),
        ),
      ),
    );
  }
}