import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:melancholy_meter/view_model/detail_page_view_model.dart';

class MonthlyChart extends StatelessWidget {
  const MonthlyChart({
    Key? key,
    required DetailPageViewMode getXController
  }) : _controller = getXController,
        super(key: key);

  final DetailPageViewMode _controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.60,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
            color: Colors.blueGrey,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0
              )
            ]),
        child: Column(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Monthly Chart',
              style: TextStyle(
                  fontSize: 24.0, color: Colors.white),
            ),
            Flexible(
              child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(color: Colors.white)),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BarChart(BarChartData(
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                              tooltipBgColor: Colors.blueGrey,
                              getTooltipItem: (group,
                                  groupIndex, rod, rodIndex) {
                                String dayStatus;
                                switch (group.x.toInt()) {
                                  case 0:
                                    dayStatus = '매우 우울';
                                    break;
                                  case 1:
                                    dayStatus = '우울';
                                    break;
                                  case 2:
                                    dayStatus = '보통';
                                    break;
                                  case 3:
                                    dayStatus = '좋음';
                                    break;
                                  case 4:
                                    dayStatus = '아주 좋음';
                                    break;
                                  default:
                                    throw Error();
                                }
                                return BarTooltipItem(
                                  dayStatus + '\n',
                                  TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: (rod.y.toInt())
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        titlesData: FlTitlesData(
                            show: false
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: showingGroups(
                            _controller.outputMonthly),
                      )))),
            ),
          ],
        ),
      ),
    );
  }
}
BarChartGroupData makeGroupData(
    int x,
    double y, {
      bool isTouched = false,
      Color barColor = Colors.white,
      double width = 10,
      List<int> showTooltips = const [],
    }) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        y: isTouched ? y + 1 : y,
        colors: isTouched ? [Colors.yellow] : [barColor],
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          y: 8,
          colors: [Color(0xff72d8bf)],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> showingGroups(List<double> monthlyStatus) =>
    List.generate(5, (i) {
      switch (i) {
        case 0:
          return makeGroupData(0, monthlyStatus[0]);
        case 1:
          return makeGroupData(1, monthlyStatus[1]);
        case 2:
          return makeGroupData(2, monthlyStatus[2]);
        case 3:
          return makeGroupData(3, monthlyStatus[3]);
        case 4:
          return makeGroupData(4, monthlyStatus[4]);
        default:
          return throw Error();
      }
    });