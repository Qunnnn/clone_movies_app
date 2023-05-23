import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final defaultData = <String, dynamic>{'hour': 0, 'minute': 0};
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  Future<bool?> readStatus({required String key}) async {
    final SharedPreferences pref = await _pref;
    final bool? status = pref.getBool(key);
    return status;
  }

  Future<void> writeStatus({required String key, required bool status}) async {
    final SharedPreferences pref = await _pref;
    pref.setBool(key, status);
  }
   


  readSchedule() async {
    final SharedPreferences pref = await _pref;
    final String getData =
        pref.getString('scheduleDailyDetails') ?? jsonEncode(defaultData);
    return jsonDecode(getData);
  }

  saveSchedule(value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('scheduleDailyDetails', jsonEncode(value));
  }

  Future<void> delete({required String key}) async {
    final SharedPreferences pref = await _pref;
    await pref.remove(key);
  }
}
