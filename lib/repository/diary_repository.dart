import 'dart:collection';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DiaryRepository {
  final box = GetStorage();

  RxMap<dynamic, dynamic> makeMemoItems() {
    RxMap<dynamic, dynamic> memoItems = {}.obs;

      final keys = box.getKeys();
      final sortedKey = SplayTreeSet.from(keys);

      for(String key in sortedKey) {
        memoItems[key] = (box.read(key))[1];
    }

    return memoItems;
  }
}