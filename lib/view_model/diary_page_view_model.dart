import 'package:flutter/material.dart';
import 'package:melancholy_meter/repository/diary_repository.dart';

class DiaryPageViewModel extends ChangeNotifier {

  DiaryPageViewModel(this._repository);

  final _repository;

  Map<String, String> _memoItems = {};

  Map<String, String> get memoItems => _memoItems;

  void getMemoItems () async {
    _memoItems = await _repository.makeMemoItems();
    notifyListeners();
  }
}