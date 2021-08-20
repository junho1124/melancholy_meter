import 'dart:collection';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailRepository {
  final String now = DateFormat('yyyy-MM-dd').format(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  Future<SharedPreferences>? setPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<List<List<String>>> getAllStatus() async {
    final SharedPreferences? prefs;
    prefs = await setPrefs();

    List<List<String>> prefsList = [];
    if (prefs != null) {
      final keys = prefs.getKeys();
      final sortedKey = SplayTreeSet.from(keys);
      for (String key in sortedKey) {
        prefsList.add(prefs.getStringList(key) ?? []);
      }
      return prefsList;
    }
    return prefsList;
  }

  Future<List<String>> getNowStatus() async {
    final SharedPreferences? prefs;
    prefs = await setPrefs();

    if (prefs != null) {
      return prefs.getStringList('$now') ?? [];
    } else
      return [];
  }

  //한달간의 기분 정보를 가져옴
  Future<List<double>> getMonthlyStatus() async {
    final SharedPreferences? prefs;
    List<double> monthlyStatus = List.generate(5, (index) => 0);
    prefs = await setPrefs();
    if (prefs != null) {
      final keys = prefs.getKeys();
      final sortedKey = SplayTreeSet.from(keys);

      for (String key in sortedKey) {
        int status = int.parse((prefs.getStringList(key) ?? [])[0]);
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
    }
    return monthlyStatus;
  }

  void clear() async {
    final SharedPreferences? prefs;
    prefs = await setPrefs();
    if (prefs != null) {
      prefs.clear();
    }
  }
}
