import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/models/avalabilitymodel.dart';

import 'package:http/http.dart'as http;
class AddedRelationListRepo {
  static Future<AvailabiltiyModel> getAddRelationList() async {
    try {
      final response = await http.get(Uri.parse(
          'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/availability?therapist_id=${therapistId}'));
     // print(response.statusCode.toString());

      if (response.statusCode == 200) {
        AvailabiltiyModel data = availabiltiyFromJson(response.body);
        return data;
      } else {
        throw Exception(
            "Error accessing the AddedRealtionList API \nStatus Code: " +
                response.statusCode.toString());
      }
    } catch (error) {
      print(error);
    }
  }
}