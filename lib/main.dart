import 'package:flutter/material.dart';
import 'package:melancholy_meter/repository/detail_repository.dart';
import 'package:melancholy_meter/repository/diary_repository.dart';
import 'package:melancholy_meter/repository/status_repository.dart';
import 'package:melancholy_meter/ui/main_page/page/main_page.dart';
import 'package:melancholy_meter/view_model/detail_page_view_model.dart';
import 'package:melancholy_meter/view_model/diary_page_view_model.dart';
import 'package:melancholy_meter/view_model/main_page_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  final statusRepository = StatusRepository();
  final detailRepository = DetailRepository();
  final diaryRepository = DiaryRepository();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MainPageViewModel(statusRepository)),
      ChangeNotifierProvider(create: (_) => DetailPageViewMode(detailRepository)),
      ChangeNotifierProvider(create: (_) => DiaryPageViewModel(diaryRepository)),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MainPage()));
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
