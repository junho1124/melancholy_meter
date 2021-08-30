import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:melancholy_meter/model/maxim_model.dart';

class MaximRepository extends GetConnect {
  final String now = DateFormat('yyyy-MM-dd').format(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  final box = GetStorage();

  List<Maxim> maximModel = [];

  List<dynamic> getNowStatus() {
    return box.read('$now');
  }

  Future<Response> getMaxim() => get(
      'https://raw.githubusercontent.com/golbin/hubot-maxim/master/data/maxim.json');

  Future<void> fetch() async {
    Response response = await getMaxim();
    Iterable body = jsonDecode(response.body);
    // List body = response.body;
    maximModel = body.map((e) => Maxim.fromJson(e)).toList();
  }
}
