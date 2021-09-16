import 'dart:convert';

import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/addAvailabilityModel.dart';
import 'package:mental_health/models/avalabilitymodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAvailabilityRepo extends BaseRepository {
  static Future<AddAvailabilityResponseModel> addAvailability(
      List<Map<String, dynamic>> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("therapistid");
    final uri =
        'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/availability?therapist_id=$id';
    var response = await Dio().put(uri,
        data: jsonEncode(body),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    print('res code :${response.statusCode}');
    print('response:${response.data}');
    AddAvailabilityResponseModel result =
        AddAvailabilityResponseModel.fromJson(response.data);
    return result;
  }
}
