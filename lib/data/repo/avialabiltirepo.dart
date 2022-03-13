import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/avalabilitymodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Avalabilityrepo extends BaseRepository {
  static Future<AvailabiltiyModel> avialabilityRepo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("therapistid");
    print('ID:$id');
    final uri =
        'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/availability?therapist_id=$id';
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    print('ers type:${response.data.runtimeType}');
    print('ers:${AvailabiltiyModel.fromJson(response.data)}');
    AvailabiltiyModel result = AvailabiltiyModel.fromJson(response.data);
    return result;
/*
    try {
      if (response.data != null) {
        final passEntity = availabiltiyFromJson(response.data);
        return passEntity;
      } else {
        return response.data;
      }
    } catch (error, stacktrace) {
      print(error);
    }*/
  }
}
