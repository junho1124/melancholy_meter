import 'package:flutter/material.dart';
import 'package:melancholy_meter/repository/detail_repository.dart';

class DetailPageViewMode extends ChangeNotifier {
  List<List<String>> _output = [];

  List<String> _outputNow = [];

  List<double> _outputMonthly = [];

  bool _isLoaded = false;

  bool _isButtonChange = false;

  List<List<String>> get output => _output;

  List<String> get outputNow => _outputNow;

  List<double> get outputMonthly => _outputMonthly;

  bool get isLoaded => _isLoaded;

  bool get isButtonChange => _isButtonChange;

  DetailPageViewMode(this._repository);

  DetailRepository _repository;

  void getAllStatus() async {
    _isLoaded = false;
    _output = await _repository.getAllStatus();
    _outputNow = await _repository.getNowStatus();
    _outputMonthly = await _repository.getMonthlyStatus();

    _isLoaded = true;
    notifyListeners();
  }

  void clearStatus() {
    _repository.clear();
    notifyListeners();
  }

  void buttonChange() {
    _isButtonChange = !_isButtonChange;
    notifyListeners();
  }

}
