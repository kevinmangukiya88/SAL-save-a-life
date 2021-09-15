import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/models/UploadImagesModal.dart';

class UploadImagesRepo extends BaseRepository {
  Future<UploadImagesModal> uploadImage(BuildContext context,
      {File image}) async {
    FormData formData = new FormData.fromMap({
      "type":"4"
    });

    if (image != null && image != "") {
      var filename = image.path.split('/').last;
      if (!filename.contains(".")) {
        filename = filename + ".jpg";
      }
      formData.files.add(MapEntry("file",
          await MultipartFile.fromFile(image.path, filename: filename)));
    }

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
      {
        try {
          final response = await dio.post("https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/upload",
              data: formData,
              options: Options(
                headers: {'content-type': 'multipart/form-data',"accept": "application/json"},
              )
          );
          print(response.statusCode);
          print(response.request);
          final passEntity = UploadImagesModal.fromJson(response.data);
          return passEntity;
        } catch (error, stacktrace)
        {
          print(error);
          return UploadImagesModal( );
        }
      }
    } on SocketException catch (_)
    {
      Fluttertoast.showToast(
          msg: "No Internet Connection",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}