import '../api/sections_api.dart';
import '../shared_prefs/shared_prefs.dart';

class SectionsRepo {
  static final SectionsApi _sectionsApi = SectionsApi();

  Future<List<String>> fetchSections() async {
    try {
      final result = await _sectionsApi.getSections();
      SharedPrefs.sp.setSectionsList(result);
      return result;
    } catch (e) {
      return await SharedPrefs.sp.getSectionsList();
    }
  }
}
