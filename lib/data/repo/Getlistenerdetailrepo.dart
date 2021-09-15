import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/Getlistenermodel.dart';
import 'package:mental_health/models/getTherapistDetailModal.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GetListenerDetailRepo extends BaseRepository {

  Future<GetListenerDetailModal> getTherapistDetail({String therapistId,
    BuildContext context,
  }) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    var therapis=prefs.getString('therapistid');
    var type;
    if(prefs.getString("type")=="Therapist"){
      type="therapist_id";
    }
    else{
      type="listener_id";
      print("hilscjkasc;jk"+type.toString().substring(0,8));
    }

    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/${type.toString().substring(0,8)}?${type}=${therapis}';
    print(uri);
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = GetListenerDetailModal.fromJson(response.data);
        print(therapistId);
        return passEntity;

      } else {
        return GetListenerDetailModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

