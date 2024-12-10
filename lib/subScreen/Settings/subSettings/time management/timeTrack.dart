import 'package:shared_preferences/shared_preferences.dart';

class TimeStorage {
  static const String keyPrefix = 'usage';

  static Future<void> sessionTime(int inSec) async {
    final pref = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T').first;
    final key = '$keyPrefix$today';

    int totalUsage = pref.getInt(key) ?? 0;
    totalUsage += inSec;

    await pref.setInt(key, totalUsage);
  }

  static Future<int> getTodayUse() async {
    final pref = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T').first;
    final key = '$keyPrefix$today';

    return pref.getInt(key) ?? 0;
  }

  static Future<List<int>> getWeeklyUse() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();

    List<int> weaklyUse = [];
    for (int i = 0; i < 7; i++) {
      final date =
          now.subtract(Duration(days: i)).toIso8601String().split('T').first;
      final key = '$keyPrefix$date';
      weaklyUse.add(prefs.getInt(key) ?? 0);
    }
    return weaklyUse.reversed.toList();
  }
}
