import 'package:get/get.dart';
import 'package:melancholy_meter/repository/diary_repository.dart';

class DiaryPageViewModel extends GetxController {

  DiaryPageViewModel(this._repository);

  final DiaryRepository _repository;

  void onInit() {
    super.onInit();
    _memoItems = _repository.makeMemoItems();
  }

  RxList _isTab = [].obs;

  RxList get isTab => _isTab;

  void tabbed(int index) {
    _isTab.add(index);
  }

  RxMap<dynamic, dynamic> _memoItems = {}.obs;

  RxMap<dynamic, dynamic> get memoItems => _memoItems;
}