import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final defaultData = <String, dynamic>{
    'hour': 0,
    'minute': 0,
    'status': false
  };

  Future<bool?> readStatus({required String key}) async {
    final Future<SharedPreferences> pref0 = SharedPreferences.getInstance();
    final SharedPreferences pref = await pref0;
    final bool? status = pref.getBool(key);
    return status;
  }

  Future<void> writeStatus({required String key, required bool status}) async {
    final Future<SharedPreferences> pref0 = SharedPreferences.getInstance();
    final SharedPreferences pref = await pref0;
    pref.setBool(key, status);
  }

  readSchedule() async {
    final Future<SharedPreferences> pref0 = SharedPreferences.getInstance();
    final SharedPreferences pref = await pref0;
    final String getData =
        pref.getString('scheduleDailyDetails') ?? jsonEncode(defaultData);
    return jsonDecode(getData);
  }

  saveSchedule(value) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('scheduleDailyDetails', jsonEncode(value));
  }

  Future<void> delete({required String key}) async {
    final Future<SharedPreferences> pref0 = SharedPreferences.getInstance();
    final SharedPreferences pref = await pref0;
    await pref.remove(key);
  }
}
