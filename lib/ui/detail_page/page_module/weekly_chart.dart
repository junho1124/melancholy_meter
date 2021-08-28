import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:melancholy_meter/util/selected_icon_color.dart';
import 'package:melancholy_meter/view_model/detail_page_view_model.dart';
import '../util.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({
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
            SizedBox(height: 16.0,),
            Text(
              '기분 척도',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.white),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LineChart(LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.white,
                            strokeWidth: 0.5,
                          );
                        },
                        getDrawingVerticalLine: (value) {
                          return FlLine(
                            color: Colors.white,
                            strokeWidth: 0.5,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: false,
                      ),
                      borderData: FlBorderData(
                          show: false),
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 4,
                      lineBarsData: [
                        LineChartBarData(
                          spots: getResentStates(_controller),
                          isCurved: true,
                          colors: [Colors.deepPurpleAccent],
                          barWidth: 5,
                          isStrokeCapRound: false,
                          dotData: FlDotData(
                            show: false,
                          ),
                        ),
                      ],
                      lineTouchData: LineTouchData(
                        getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
                          return spotIndexes.map((spotIndex) {
                            final spot = barData.spots[spotIndex];
                            if (spot.x == 7) {
                              return null;
                            }
                            return TouchedSpotIndicatorData(
                              FlLine(color: Colors.transparent),
                              FlDotData(
                                getDotPainter: (spot, percent, barData, index) {
                                    return FlDotCirclePainter(
                                        radius: 8,
                                        color: selectedIconColor(spot.y.toInt()),
                                        strokeWidth: 1,
                                        strokeColor: Colors.white);
                                },
                              ),
                            );
                          }).toList();
                        },
                        touchTooltipData: LineTouchTooltipData(
                          tooltipBgColor: Colors.transparent,
                            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                              return touchedBarSpots.map((barSpot) {
                                  return null;
                              }).toList();
                            },
                            ),
                          ),
                      )
                    ))),
              ),
          ],
        ),
      ),
    );
  }
}
