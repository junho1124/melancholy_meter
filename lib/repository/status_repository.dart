import 'package:intl/intl.dart';
import 'package:get_storage/get_storage.dart';

class StatusRepository {

  final String now = DateFormat('yyyy-MM-dd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  final box = GetStorage();

  void save(String memo, int status) {
    List<String> input = [status.toString(), memo];
    box.write('$now', input);
  }

  void saveFake() {

    List<List<String>> fakeInput = [
      ['1', '첫번째'],
      ['3', '두번째'],
      ['0', '세번째'],
      ['2', '네번째'],
      ['1', '다섯번째'],
      ['4', '여섯번째'],
      ['3', '일곱번째'],
    ];
    for(int i = 0; i < fakeInput.length; i++) {
        box.write('2021-08-1$i', fakeInput[i]);
    }
  }
}