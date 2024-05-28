import 'package:car/const/global.dart';
import 'package:car/const/save.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shp {
  static saveloginfo() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("username", Global.savedata!.username);
    await s.setString("pass", Global.savedata!.password);
    print(Global.savedata!.username);
    print(Global.savedata!.password);
    print('Saving');
  }

  static Future<Savedata> loadloginfo() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    Savedata save = Savedata(username: "non", password: "non");
    save.username = s.getString("username") ?? "";
    save.password = s.getString("pass") ?? "";
    Global.savedata = save;
    print("Loading");
    return Global.savedata!;
  }
}
