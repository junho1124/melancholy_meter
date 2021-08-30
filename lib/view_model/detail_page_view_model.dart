import 'package:get/get.dart';
import 'package:melancholy_meter/repository/detail_repository.dart';

class DetailPageViewMode extends GetxController {
  List<List<String>> _output = [];

  List<dynamic> _outputNow = [];

  List<double> _outputMonthly = [];

  bool _isLoaded = false;

  RxBool _isButtonChange = false.obs;

  List<List<String>> get output => _output;

  List<dynamic> get outputNow => _outputNow;

  List<double> get outputMonthly => _outputMonthly;

  bool get isLoaded => _isLoaded;

  RxBool get isButtonChange => _isButtonChange;

  DetailPageViewMode(this._repository);

  DetailRepository _repository;

  void onInit() {
    super.onInit();
    _isLoaded = false;
    _output = _repository.getAllStatus();
    _outputNow = _repository.getNowStatus();
    _outputMonthly = _repository.getMonthlyStatus();

    _isLoaded = true;
  }

  void clearStatus() {
    _repository.clear();
    update();
  }

  void buttonChange() {
    _isButtonChange.value = !_isButtonChange.value;
  }

}
