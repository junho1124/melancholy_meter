import 'dart:collection';

import 'package:intl/intl.dart';
import 'package:get_storage/get_storage.dart';

class DetailRepository {
  final String now = DateFormat('yyyy-MM-dd').format(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  final box = GetStorage();

  List<List<String>> getAllStatus() {

    List<List<String>> prefsList = [];

    final keys = box.getKeys();
    final sortedKey = SplayTreeSet.from(keys);
    for (String key in sortedKey) {
      List<dynamic> resultDynamic = box.read(key);
      List<String> result = resultDynamic.map((e) => e.toString()).toList();
      prefsList.add(result);
    }
    return prefsList;
  }

  List<dynamic> getNowStatus() {
      return box.read('$now');
  }

  //한달간의 기분 정보를 가져옴
  List<double> getMonthlyStatus() {
    List<double> monthlyStatus = List.generate(5, (index) => 0);
      final keys = box.getKeys();
      final sortedKey = SplayTreeSet.from(keys);

      for (String key in sortedKey) {
        int status = int.parse((box.read(key))[0]);
        int count = 0;
        if (status == 0) {
          monthlyStatus[0]++;
        }
        if (status == 1) {
          monthlyStatus[1]++;
        }
        if (status == 2) {
          monthlyStatus[2]++;
        }
        if (status == 3) {
          monthlyStatus[3]++;
        }
        if (status == 4) {
          monthlyStatus[4]++;
        }
        count++;
        if (count > 30 || count > sortedKey.length) {
          break;
        }
      }
    return monthlyStatus;
  }

  void clear() {
      box.erase();
  }
}
