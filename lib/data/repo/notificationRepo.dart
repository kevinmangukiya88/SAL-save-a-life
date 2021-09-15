import 'package:flutter/material.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/GetPaymentsModal.dart';
import 'package:mental_health/models/notificationModal.dart';


class NotificationRepo extends BaseRepository {
  Future<NotificationModal> notificationRepo(
    BuildContext context,
  ) async {
    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/notification?therapist_id=${therapistId}';
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = NotificationModal.fromJson(response.data);
        return passEntity;
      } else {
        return NotificationModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

