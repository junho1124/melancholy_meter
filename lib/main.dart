import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:melancholy_meter/ui/main_page/page/main_page.dart';

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

class WellComePage extends StatefulWidget {
  const WellComePage({Key? key}) : super(key: key);

  @override
  _WellComePageState createState() => _WellComePageState();
}

class _WellComePageState extends State<WellComePage> {
  @override
  Widget build(BuildContext context) {
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
              Text(
                ' 우울 미터기',
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
              IconButton(
                  onPressed: () {
                    Get.off(MainPage());
                  },
                  icon: Icon(
                    Icons.not_started_outlined,
                    size: 60,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
