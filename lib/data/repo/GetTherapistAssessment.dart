import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/models/AppointmentModal.dart';
import 'package:dio/dio.dart';


class GetTherapistAssessmentRepo extends BaseRepository {

  Future<Appointmentmodel> assessment({String assessmentId,
    BuildContext context,
  }) async {
    final uri = '${ApiEndpoint.BaseUrl}assessment';
    var response = await Dio().get(uri,
        queryParameters:
        {'assessment_id  ': assessmentId},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
          followRedirects: false,
        ));
    try {
      if (response.data != null) {
        final passEntity = Appointmentmodel.fromJson(response.data);
        return passEntity;
      } else {
        return Appointmentmodel(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

