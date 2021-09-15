import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/GetAvailableAssessmentModal.dart';
import 'package:mental_health/models/GetPaymentsModal.dart';


class GetAvailableAssessmentRepo extends BaseRepository {

  Future<GetAvailableAssessmentModal> getAssessment({String therapistId,
    BuildContext context,
  }) async {
    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/assessments';
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = GetAvailableAssessmentModal.fromJson(response.data);
        return passEntity;
      } else {
        return GetAvailableAssessmentModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

