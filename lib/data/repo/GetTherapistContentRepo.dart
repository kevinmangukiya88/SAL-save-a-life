import 'package:flutter/material.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/GetTherapistContentModal.dart';


class GetTherapistContentRepo extends BaseRepository {

  Future<GetTherapistContentModal> getContent({
    BuildContext context,
  }) async {
    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/training?therapist_id=${therapistId}';
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = GetTherapistContentModal.fromJson(response.data);
        return passEntity;
      } else {
        return GetTherapistContentModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

