import 'dart:convert';

import 'package:get/get.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/avalabilitymodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddEventRepo extends BaseRepository {
  static Future<dynamic> addEvent({Map<String, String> body}) async {
    final counsellorUri =
        'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/counsellor/event/block/order';
    final therapistUri =
        'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/event/block/order';
    SharedPreferences pref = await SharedPreferences.getInstance();

    String type = pref.getString('type');
    print('URL :${type == 'Therapist' ? therapistUri : counsellorUri}');
    try {
      var response =
          await Dio().post(type == 'Therapist' ? therapistUri : counsellorUri,
              data: jsonEncode(body),
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                },
              ));
      print('add Event response : ${response.data}');
      if (response.data['meta']['status'] == "200") {
        return true;
      }
      Get.showSnackbar(GetBar(
        message: 'Event not add please try again',
        duration: Duration(seconds: 2),
      ));
      return false;
    } catch (e) {
      print("Add Event Error :$e");
      Get.showSnackbar(GetBar(
        message: 'Event not add please try again',
        duration: Duration(seconds: 2),
      ));
      return false;
    }
  }
}
