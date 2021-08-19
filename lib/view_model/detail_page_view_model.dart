import 'package:flutter/material.dart';
import 'package:melancholy_meter/repository/detail_repository.dart';

class DetailPageViewMode extends ChangeNotifier {
  List<List<String>> _output = [];

  List<String> _outputNow = [];

  bool _isLoaded = false;

  List<List<String>> get output => _output;

  List<String> get outputNow => _outputNow;

  bool get isLoaded => _isLoaded;

  DetailPageViewMode(this._repository);

  DetailRepository _repository;

  void getAllStatus() async {
    _isLoaded = false;
    _output = await _repository.getAll();
    _outputNow = await _repository.getNow();
    _isLoaded = true;
    notifyListeners();
  }

  void clearStatus() {
    _repository.clear();
    notifyListeners();
  }
}
