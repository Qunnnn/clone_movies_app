import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<bool?> read() async {
    final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences pref = await _pref;
    final bool? status = pref.getBool("statusLogin");
    return status;
  }

  write(bool status) async {
    final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences pref = await _pref;
    pref.setBool("statusLogin", status);
  }

  delete() async {
    final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences pref = await _pref;
    await pref.remove("statusLogin");
  }
}
