import 'package:melancholy_meter/repository/status_repository.dart';
import 'package:get/get.dart';

class MainPageViewModel extends GetxController {

  MainPageViewModel(this.repository);

  final StatusRepository repository;

  RxInt _selected = 2.obs;

  RxInt get selected => _selected;

  void select(int value) {
    _selected.value = value;
    update();
  }

  void saveStatus(String memo) {
    repository.save(memo, _selected.value);
  }

  void saveFake() {
    repository.saveFake();
  }
}