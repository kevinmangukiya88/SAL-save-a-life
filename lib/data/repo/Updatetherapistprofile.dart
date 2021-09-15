import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/data/api/ApiHitter.dart';
import 'package:mental_health/models/CreateCounsellorModal.dart';
import 'package:mental_health/models/Updateprofilemodal.dart';
import 'package:nb_utils/nb_utils.dart';


class Updatetherapistprofile extends BaseRepository {

  Future<UpdateProfileModel> createCounsellor({
    String aadhar,
    String about,
    String certificate,
    String device_id,
    String education,
    String email,
    String experience,
    String first_name,
    String gender,
    String language_ids,
    String last_name,
    String linkedin,
    String phone,
    String photo,
    String price,
    String price_3,
    String price_5,
    String resume,
    String topic_ids
  }) async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    var id= prefs.getString("therapistid");
    final response = await dio.put
       ("https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist?therapist_id=${id}",

        data: {
          "bank_account_no": "String",
          "bank_account_type": "String",
          "bank_name": "String",
          "branch_name": "String",
          "photo":photo,
          "device_id": "String",
          "education": education,
          "email": email,
          "experience": experience,
          "first_name": first_name,
          "gender": gender,
          "ifsc": "String",
          "language_ids": language_ids,
          "last_name": last_name,
          "linkedin": linkedin,
          "pan": "String",
          "payee_name": "String",
          "payout_percentage": "String",
          "phone": "$phone",
          "price": price,
          "price_3": price_3,
          "price_5": price_5,
          "timezone": "String",
          "topic_ids": topic_ids
        });
    {
      try {
        if (response.statusCode != null) {

          final passEntity = UpdateProfileModel.fromJson(response.data);

          return passEntity;
        } else {
          return UpdateProfileModel(meta: response.data);
        }
      } catch (error, stacktrace) {
        return UpdateProfileModel();
      }
    }
  }

}
