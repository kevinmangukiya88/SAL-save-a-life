import 'package:flutter/material.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/GetHomeContentModal.dart';
import 'package:mental_health/models/GetTherapistContentModal.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GetHomePageContentRepo extends BaseRepository {
var therapis;
  Future<GetHomeContentModal> getHomeContent({
    BuildContext context,
  }) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    therapis=prefs.getString('therapistid');
    var type;
   if(prefs.getString("type")=="Therapist"){
     type="therapist_id";
   }
   else{
     type="listener_id";
   }
    print("gfd"+therapis);
    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/home?${type}=${therapis}';

    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = GetHomeContentModal.fromJson(response.data);
        return passEntity;
      } else {
        return GetHomeContentModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

