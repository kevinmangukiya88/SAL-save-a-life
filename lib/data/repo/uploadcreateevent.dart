import 'dart:io';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart' as dio;

class UploadImageRepo extends BaseRepository {
  static Future<String> uploadImage({String image}) async {
    try {
      dio.FormData formData = new dio.FormData.fromMap(
          {'file': await dio.MultipartFile.fromFile(image), 'type': 'client'});

      dio.Response result = await dio.Dio().post(
          "https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/upload",
          data: formData,
          options: dio.Options(
            contentType: "form-data",
          ));
      print('File upload Response: ${result.data}');
      if(result.statusCode==200){

        if(result.data['meta']['status']=="200"){
          // return result.data['media_url']+result.data['file'];
          return result.data['file'];
        }else{
          return null;
        }
      }

    } catch (e) {
      print('File upload error :$e');
      return null;
    }
  }
// Future<UploadImagesModal> uploadImage(BuildContext context,
//     {File image}) async {
//   FormData formData = new FormData.fromMap({
//     "type":"4"
//   });
//
//   if (image != null && image != "") {
//     var filename = image.path.split('/').last;
//     if (!filename.contains(".")) {
//       filename = filename + ".jpg";
//     }
//     formData.files.add(MapEntry("file",
//         await MultipartFile.fromFile(image.path, filename: filename)));
//   }
//
//   try {
//     final result = await InternetAddress.lookup('google.com');
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
//     {
//       try {
//         final response = await dio.post(ApiEndpoint.uploadeventImages,
//             data: formData,
//             options: Options(
//               headers: {'content-type': 'multipart/form-data',"accept": "application/json"},
//             )
//         );
//         final passEntity = UploadImagesModal.fromJson(response.data);
//         return passEntity;
//       } catch (error, stacktrace)
//       {
//         return UploadImagesModal( );
//       }
//     }
//   } on SocketException catch (_)
//   {
//     Fluttertoast.showToast(
//         msg: "No Internet Connection",
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.CENTER,
//         backgroundColor: Colors.black,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }
// }
}
