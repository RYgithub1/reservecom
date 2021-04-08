import 'package:shared_preferences/shared_preferences.dart';

import '../data/mark.dart';


const PREF_MARK_KEY = 'pref_mark_key';


class DatabaseManager {
  // Future<bool> markIt(Mark mark) async {
  // Future<List<String>> markIt(Mark mark) async {
  Future<void> markIt(Mark mark) async {
    final markString =[
      mark.markId.toString(),
      mark.propertyId.toString(),
      mark.markUserId.toString(),
      mark.markDateTime.toString(),
    ];
    // await _db.coll.xxx
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // return prefs.setStringList(PREF_MARK_KEY, markString);  // bool
    prefs.setStringList(PREF_MARK_KEY, markString);  // bool



  }


}