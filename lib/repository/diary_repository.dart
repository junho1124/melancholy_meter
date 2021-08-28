import 'dart:collection';

import 'package:shared_preferences/shared_preferences.dart';

class DiaryRepository {
  Future<SharedPreferences>? setPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<Map<String, String>> makeMemoItems() async {
    final prefs = await setPrefs();
    Map<String, String> memoItems = {};

    if(prefs != null) {
      final keys = prefs.getKeys();
      final sortedKey = SplayTreeSet.from(keys);

      for(String key in sortedKey) {
        memoItems[key] = (prefs.getStringList(key) ?? [])[1];
      }
    }

    return memoItems;
  }
}