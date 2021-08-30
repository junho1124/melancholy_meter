import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:melancholy_meter/ui/wellcome_page/page/wellcome_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'GowunDodum_Regular',
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
      ),
      home: WellComePage(),
    );
  }
}


