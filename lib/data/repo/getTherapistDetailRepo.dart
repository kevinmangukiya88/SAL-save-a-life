import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/getTherapistDetailModal.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GetTherapistDetailRepo extends BaseRepository {

  Future<GetTherapistDetailModal> getTherapistDetail({String therapistId,
    BuildContext context,
  }) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
   var therapis=prefs.getString('therapistid');
    var type;
    var role;
    if(prefs.getString("type")=="Therapist"){
      type="therapist_id";
      role="therapist";
    }
    else{
      type="listener_id";
      role="listener";
      print("hilscjkasc;jk"+type.toString().substring(0,8));
    }

    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/${role}?${type}=${therapis}';
    print(uri);
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = GetTherapistDetailModal.fromJson(response.data);
        print(therapistId);
        return passEntity;

      } else {
        return GetTherapistDetailModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

