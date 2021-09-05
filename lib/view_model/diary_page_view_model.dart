import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:melancholy_meter/repository/diary_repository.dart';

class DiaryPageViewModel extends GetxController {
  DiaryPageViewModel(this._repository);

  final DiaryRepository _repository;

  final box = GetStorage();

  void onInit() {
    super.onInit();
    _memoItems = _repository.makeMemoItems();
  }

  RxList _isTab = [].obs;

  RxList get isTab => _isTab;

  void tabbed(int index) {
    if (_isTab.contains(index)) {
      _isTab.clear();
    } else {
      _isTab.clear();
      _isTab.add(index);
    }
    print(_isTab);
  }

  void reviseMemo(String key, String newMemo) {
    box.write(key, newMemo);
  }

  RxMap<dynamic, dynamic> _memoItems = {}.obs;

  RxMap<dynamic, dynamic> get memoItems => _memoItems;
}
