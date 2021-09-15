import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/data/api/ApiHitter.dart';
import 'package:mental_health/models/BookEventModal.dart';


class BookAnEventRepo extends BaseRepository {
  // BuildContext context;
  Future<BookEventModal> bookEvent({
    String date,
    String description,
    BuildContext context,
    String duration,
    String price,
    String therapist_id,
    String time, String title, String topic_id
  }) async {
    ApiResponse apiResponse = await apiHitter
        .getPostApiResponse(ApiEndpoint.bookAnEvent, context: context, headers: {
      'Content-Type': 'application/json',
    }, data: {
      "date": date,
      "description": description ,
      "duration": duration,
      "price": price,
      "therapist_id": therapist_id,
      "time": time,
      "title": title,
      "topic_id": topic_id
    });

    {
      try {
        if (apiResponse.status) {
          final passEntity = BookEventModal.fromJson(apiResponse.response.data);
          return passEntity;
        } else {
          return BookEventModal(meta: apiResponse.response.data);
        }
      } catch (error, stacktrace) {}
    }
  }
}
