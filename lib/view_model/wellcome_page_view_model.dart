import 'package:get/get.dart';
import 'package:melancholy_meter/repository/wellcome_repository.dart';
import 'dart:math';

class WellComePageViewModel extends GetxController {
  WellComePageViewModel(this._repository);

  final MaximRepository _repository;

  RxString maxim = ''.obs;

  int index = 0;

  RxBool isWrite = false.obs;

  void onInit() {
    super.onInit();
    if(_repository.getNowStatus().isEmpty) {
      isWrite.value = true;
    }
    _repository.fetch().whenComplete(() => maxim.value = _repository.maximModel[Random().nextInt(_repository.maximModel.length)].message ?? '');
  }

}