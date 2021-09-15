import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/models/AppointmentModal.dart';
import 'package:dio/dio.dart';


class CancelAppointmentRepo extends BaseRepository {

  Future<Appointmentmodel> cancelAppointment({String apppointmentd,
    BuildContext context,
  }) async {
    final uri = '${ApiEndpoint.BaseUrl}appointment';
    var response = await Dio().get(uri,
        queryParameters:
        {'appointment_id ': apppointmentd},
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

