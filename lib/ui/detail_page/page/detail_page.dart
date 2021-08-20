import 'package:flutter/material.dart';
import 'package:melancholy_meter/ui/detail_page/page_module/monthly_chart.dart';
import 'package:melancholy_meter/ui/detail_page/page_module/status_now.dart';
import 'package:melancholy_meter/ui/detail_page/page_module/weekly_chart.dart';
import 'package:melancholy_meter/view_model/detail_page_view_model.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    context.read<DetailPageViewMode>().getAllStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailPageViewMode>();
    return Scaffold(
        appBar: AppBar(
          title: Text('내 기분'),
          actions: [
            IconButton(
                onPressed: () {
                  viewModel.buttonChange();
                },
                icon: viewModel.isButtonChange
                    ? Icon(Icons.calendar_view_month)
                    : Icon(Icons.calendar_view_week))
          ],
        ),
        body: viewModel.isLoaded
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 16.0),
                    StatusNow(),
                    SizedBox(height: 16.0),
                    Divider(color: Colors.black),
                    SizedBox(height: 16.0),
                    viewModel.isButtonChange ? MonthlyChart() : WeeklyChart()
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
