import 'package:flutter/material.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/GetTherapistModal.dart';



class GetTherapistEventRepo extends BaseRepository {
  Future<GetTherapistEventModal> therapistRepo(
    BuildContext context,
  ) async {
    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/events?therapist_id=${therapistId}';
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = GetTherapistEventModal.fromJson(response.data);
        return passEntity;
      } else {
        return GetTherapistEventModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

