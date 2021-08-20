import 'package:fl_chart/fl_chart.dart';
import 'package:melancholy_meter/view_model/detail_page_view_model.dart';

List<FlSpot> getResentStates(DetailPageViewMode viewModel) {
  final chartIndex = viewModel.output.length - 1;
  final output = viewModel.output;

  List<FlSpot> resentStates = [];
  List<double> result = [];

  for (int i = 0; i < 7; i++) {
    if (i <= chartIndex) {
      result.add(double.parse(output[chartIndex - i][0]));
    } else {
      result.add(0.1);
    }
  }
  for (int i = 0; i < 7; i++) {
    if (result[i] != 0.1) {
      resentStates.add(FlSpot(i.toDouble(), result[i]));
    }
  }

  return resentStates;
}