import 'package:flutter/material.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/models/AppointmentModal.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/GetPaymentsModal.dart';


class GetPaymentsRepo extends BaseRepository {

  Future<GetPaymentsModal> getPaymentsRepo({
    BuildContext context,
  }) async {
    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/payment?therapist_id=${therapistId}';
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = GetPaymentsModal.fromJson(response.data);
        return passEntity;
      } else {
        return GetPaymentsModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

