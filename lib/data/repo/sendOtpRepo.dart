import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/models/sendOtpModel.dart';
import 'package:dio/dio.dart';


class SendOtptoPhone extends BaseRepository {


  Future<SendOtp> sendOtp({String phone,
  BuildContext context,
  }) async {
    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/sendotp';
    var response = await Dio().get(uri,
        queryParameters:
             {'phone': phone, },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },

          followRedirects: false,
        ));
    try {
      print(response.statusCode);
      if (response.data != null) {
        final passEntity = SendOtp.fromJson(response.data);
        return passEntity;
      } else {
        return SendOtp(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}
