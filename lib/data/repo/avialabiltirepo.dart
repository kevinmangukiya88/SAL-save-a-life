import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/avalabilitymodel.dart';


class Avalabilityrepo extends BaseRepository {
  static Future<AvailabiltiyModel> avialabilityRepo() async {
    final uri =
        'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/availability?therapist_id=${therapistId}';
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = availabiltiyFromJson(response.data);
        return passEntity;
      } else {
        return response.data;
      }
    } catch (error, stacktrace) {
      print(error);
    }
  }
}
