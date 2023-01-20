
import 'package:shared_preferences/shared_preferences.dart';

void addbookmark(List<String> urls) async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setStringList("bookm", urls);
}
Future<List<String>?> readbookmark() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  List<String>? Urls=shr.getStringList("bookm");
  return Urls;
}
