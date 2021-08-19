import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatusRepository {

  final String now = DateFormat('yyyy-MM-dd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  Future<SharedPreferences>? setPrefs() async {
    return await SharedPreferences.getInstance();
  }

  void save(String memo, int status) async {
    final SharedPreferences? prefs;
    prefs = await setPrefs();

    List<String> input = [status.toString(), memo];
    if(prefs != null) {
      prefs.setStringList('$now', input);
    }
  }

  void saveFake() async {
    final SharedPreferences? prefs;
    prefs = await setPrefs();

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
      if(prefs != null) {
        prefs.setStringList('2021-08-1$i', fakeInput[i]);
      }
    }
  }
}