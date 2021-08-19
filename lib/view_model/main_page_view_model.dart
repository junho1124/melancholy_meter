import 'package:flutter/material.dart';
import 'package:melancholy_meter/repository/status_repository.dart';

class MainPageViewModel extends ChangeNotifier {

  MainPageViewModel(this.repository);

  final StatusRepository repository;

  int _selected = 2;

  int get selected => _selected;

  void select(int value) {
    _selected = value;
    notifyListeners();
  }

  void saveStatus(String memo) {
    repository.save(memo, _selected);
    notifyListeners();
  }

  void saveFake() {
    repository.saveFake();
    notifyListeners();
  }
}