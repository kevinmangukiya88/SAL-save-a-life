

import 'dart:convert';

import 'package:mental_health/models/getTherapistDetailModal.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesTest {
  final String login = "login";

  Future<String> checkIsLogin(String value) async {
    String a = "Test";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value == "0") {
      prefs.setString("login", "true");
      return a;
    } else if (value == "1") {
      String tok = prefs.getString("login");
      return tok != null ? tok : "";
    } else {
      prefs.setString("login", "false");
      return a;
    }
  }

  Future<bool> getBool(String key, {defaultValue = false}) async {
    return await getSharedPref().then((pref) {
      return pref.getBool(key) ?? defaultValue;
    });
  }

  saveRegisteredValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('registeredValue', value);
  }

  Future<bool> getRegisteredValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('registeredValue') ?? false;
  }

  saveToggleValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('toggleValue', value);
  }

  Future<bool> getTogglevalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('toggleValue') ?? false;
  }

  Future<String> saveuserdata(String type, {Therapist userdata}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type == "set") {
      prefs.setString('therapistData', json.encode(userdata.toJson()));
      return "Set";
    } else {
      String userentity = prefs.getString('therapistData');
      return userentity;
    }
  }


  Future<String> appversion(String value, String appversion) async {
    String a = "Test";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value == "0") {
      prefs.setString("AppVersion", appversion);
      return a;
    } else if (value == "1") {
      String tok = prefs.getString("AppVersion");
      if(tok==null || tok=="")
        return tok ="1";
      else
      return tok;
    } else {
      prefs.setString("AppVersion", "0");
      return a;
    }
  }

  saveTherapistId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('therapistid', value);
  }
  saveListenerid(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('therapistid', value);
  }


  getTherapistId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('therapistid') ?? "";
  }
}
