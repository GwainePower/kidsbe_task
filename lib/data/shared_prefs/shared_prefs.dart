import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;
  static final SharedPrefs sp = SharedPrefs._();

  SharedPrefs._();

  Future<SharedPreferences?> get sharedPrefs async {
    if (_sharedPrefs != null) return _sharedPrefs;
    _sharedPrefs = await SharedPreferences.getInstance();
    return _sharedPrefs;
  }

  setSectionsList(List<String> sectionsList) async {
    final sp = await sharedPrefs;
    if (sp!.containsKey('sections')) {
      sp.remove('sections');
    }
    sp.setStringList('sections', sectionsList);
  }

  Future<List<String>> getSectionsList() async {
    final sp = await sharedPrefs;
    final result = sp!.getStringList('sections');
    return result ?? [];
  }
}
