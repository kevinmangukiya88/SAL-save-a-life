import 'package:flutter/foundation.dart';

class AvailabilityModel {
  List<DateTime> selectedDates;
  List<String> selectedDays;
  DateTime selectedTimeFrom;
  DateTime selectedTimeTo;
  bool breakTime = false;

  AvailabilityModel(
      {this.selectedTimeFrom,
      this.selectedTimeTo,
      this.breakTime,
      this.selectedDays,
      this.selectedDates});

  factory AvailabilityModel.fromDate(Map<String, dynamic> data) {
    return AvailabilityModel(
      selectedDates: data['selectedDates'],
      selectedTimeTo: data['selectedTimeTo'],
      breakTime: data['breakTime'],
      selectedDays: data['selectedDays'],
      selectedTimeFrom: data['selectedTimeFrom'],
    );
  }
}
