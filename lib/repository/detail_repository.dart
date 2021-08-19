import 'dart:collection';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailRepository {

  final String now = DateFormat('yyyy-MM-dd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  Future<SharedPreferences>? setPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<List<List<String>>> getAll() async {
    final SharedPreferences? prefs;
    prefs = await setPrefs();

    List<List<String>> prefsList = [];
    if(prefs != null) {
      final keys = prefs.getKeys();
      final sortedKey = SplayTreeSet.from(keys);
      for(String key in sortedKey) {
        print(key);
          prefsList.add(prefs.getStringList(key) ?? []);
      }
      return prefsList;
    }
    return prefsList;
  }

  Future<List<String>> getNow() async {
    final SharedPreferences? prefs;
    prefs = await setPrefs();

    if(prefs != null) {

      return prefs.getStringList('$now') ?? [];
    }
    else return [];
  }

  void clear() async {
    final SharedPreferences? prefs;
    prefs = await setPrefs();
    if(prefs != null) {
      prefs.clear();
    }

  }
}