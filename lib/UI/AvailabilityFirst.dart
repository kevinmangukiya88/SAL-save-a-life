import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/controller/availability_controller.dart';
import 'package:mental_health/models/availabilityModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'Availabilty1.dart';

class AvailabilityFirst extends StatefulWidget {
  const AvailabilityFirst({Key key}) : super(key: key);

  @override
  _AvailabilityFirstState createState() => _AvailabilityFirstState();
}

class _AvailabilityFirstState extends State<AvailabilityFirst> {
  List<String> dayList = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  ShowTimesController _controller = Get.find();

  List<DateTime> selectedDates = <DateTime>[];
  List<String> selectedDays = <String>[];
  DateRangePickerController controller = DateRangePickerController();
  DateTime now = DateTime.now();
  DateTime selectedTimeFrom;
  DateTime selectedTimeTo;
  RxBool breakTime = false.obs;
  RxBool isExpanded = true.obs;
  int startTimeIndex, endTimeIndex;

  @override
  void initState() {
    selectedTimeFrom = setTime(DateTime.now());
    selectedTimeTo = setTime(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(context),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FROM',
                          style: fromToHeaderStyle(),
                        ),
                        TextButton(
                          onPressed: () {
                            _selectFromTime(context);
                          },
                          child: Text(
                            "${DateFormat.jm().format(selectedTimeFrom)}",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeVertical * 2.3,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        _selectToTime(context);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TO',
                            style: fromToHeaderStyle(),
                          ),
                          Text(
                            "${DateFormat.jm().format(selectedTimeTo)}",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeVertical * 2.3,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "REPEAT",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(fontColorGray),
                      ),
                    ),
                    Obx(() => IconButton(
                          onPressed: () {
                            isExpanded.toggle();
                          },
                          icon: Icon(
                            isExpanded.value
                                ? Icons.keyboard_arrow_down_rounded
                                : Icons.keyboard_arrow_up_rounded,
                            color: Color(fontColorGray),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _daysText(),
              SizedBox(
                height: 20,
              ),
              Obx(() => !isExpanded.value
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Divider(),
                    )
                  : AbsorbPointer(
                      absorbing: true,
                      child: SfDateRangePicker(
                        controller: controller,
                        showNavigationArrow: false,
                        allowViewNavigation: false,
                        navigationMode: DateRangePickerNavigationMode.none,
                        view: DateRangePickerView.month,
                        headerStyle: DateRangePickerHeaderStyle(
                            textAlign: TextAlign.center,
                            textStyle: fromToHeaderStyle()),
                        selectionColor: Color(backgroundColorBlue),
                        toggleDaySelection: false,
                        selectionMode: DateRangePickerSelectionMode.multiple,
                        onSelectionChanged: null,
                        cellBuilder: null,
                        onViewChanged: null,
                      ),
                    )),
              Obx(() => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: breakTime.value,
                    onChanged: (value) {
                      breakTime.toggle();
                    },
                    title: Text(
                      'Provide 30 minutes break after each session',
                    ),
                  )),
            ],
          ),
          GetBuilder<ShowTimesController>(
            builder: (controller) {
              if (controller.addAvailabilityApiResponse.value ==
                  Status.LOADING) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                  color: Colors.black38,
                );
              }
              return SizedBox();
            },
          )
        ],
      ),
    );
  }

  Row _daysText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: dayList
          .map((e) => Expanded(
                child: InkWell(
                  onTap: () {
                    if (selectedDays.contains(e)) {
                      controller.selectedDates = selectedDates
                          .where((element) =>
                              DateFormat('EEEE').format(element) != e)
                          .toList();
                      selectedDates = selectedDates
                          .where((element) =>
                              DateFormat('EEEE').format(element) != e)
                          .toList();
                      selectedDays.remove(e);
                    } else {
                      int totalDays = DateTime(now.year, now.month + 1, 0).day;
                      print('old selectedDates :$selectedDates');
                      for (int index = 1; index <= totalDays; index++) {
                        String day = DateFormat('EEEE')
                            .format(DateTime(now.year, now.month, index));
                        if (day == e) {
                          selectedDates
                              .add(DateTime(now.year, now.month, index));
                        }
                      }

                      controller.selectedDates = selectedDates;
                      selectedDays.add(e);
                    }
                    setState(() {});
                  },
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: selectedDays.contains(e)
                        ? Color(backgroundColorBlue)
                        : Colors.transparent,
                    child: Text(
                      e.substring(0, 1),
                      style: TextStyle(
                          fontSize: 16,
                          color: selectedDays.contains(e)
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  TextStyle fromToHeaderStyle() {
    return TextStyle(
        color: Color(fontColorGray),
        fontSize: SizeConfig.blockSizeVertical * 1.8,
        fontWeight: FontWeight.w600);
  }

  AppBar customAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        "Availability",
        style: TextStyle(color: Colors.black),
      ),
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_rounded,
              color: Color(backgroundColorBlue))),
      actions: [
        TextButton(
          onPressed: () async {
            if (selectedTimeTo.difference(selectedTimeFrom).inMinutes == 0) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text('Please Select To Time Greater than From Time')));
              return;
            }
            // AvailabilityModel model = AvailabilityModel();
            // model.selectedDays = selectedDays;
            // model.breakTime = breakTime.value;
            // model.selectedTimeTo = selectedTimeTo;
            // model.selectedTimeFrom = selectedTimeFrom;
            // model.selectedDates = selectedDates;
            setTimeSlot();
            // Get.back();
          },
          child: Text(
            "Save",
            style: TextStyle(
                color: Color(backgroundColorBlue), fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Future<Null> _selectToTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedTimeTo),
    );
    if (picked != null) {
      DateTime dateTime =
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      dateTime = setTime(dateTime);
      if (dateTime.difference(selectedTimeFrom).inMinutes < 0) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please Select Greater than From Time')));
        return;
      }
      setState(() {
        selectedTimeTo = dateTime;
      });
    }
  }

  Future<Null> _selectFromTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedTimeFrom),
    );
    if (picked != null) {
      DateTime dateTime =
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      dateTime = setTime(dateTime);

      if (dateTime.difference(selectedTimeTo).inMinutes > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please Select Less than To Time')));
        return;
      }
      setState(() {
        selectedTimeFrom = dateTime;
      });
    }
  }

  DateTime setTime(DateTime dateTime) {
    if (dateTime.minute > 0 && dateTime.minute < 30) {
      dateTime = dateTime.subtract(Duration(minutes: dateTime.minute));
      dateTime = dateTime.add(Duration(minutes: 30));
    } else if (dateTime.minute > 30) {
      dateTime = dateTime.subtract(Duration(minutes: dateTime.minute));
      dateTime = dateTime.add(Duration(hours: 1));
    }
    return dateTime;
  }

  Future<void> setTimeSlot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("therapistid");
    List<Map<String, dynamic>> requestList = [];

    startTimeIndex =
        (selectedTimeFrom.hour * 2) + (selectedTimeFrom.minute == 30 ? 1 : 0);
    endTimeIndex =
        (selectedTimeTo.hour * 2) + (selectedTimeTo.minute == 30 ? 1 : 0);
    print('satrt index :$startTimeIndex , end index :$endTimeIndex');
    for (String day in selectedDays) {
      Map<String, dynamic> mapData = {};
      int breakStatusCount = 0;
      // bool breakStatus = false;
      for (int index = 0; index < 48; index++) {
        if (index >= startTimeIndex && index <= endTimeIndex) {
          if (breakTime.value && breakStatusCount == 2) {
            mapData.addAll({'$index': "0"});
            breakStatusCount = 0;
          } else {
            breakStatusCount++;
            mapData.addAll({'$index': "1"});
          }
        } else {
          mapData.addAll({'$index': "0"});
        }
      }
      mapData.addAll({'weekday': setWeekIndex(day)});
      mapData.addAll({'counsellor_id': id});
      // mapData.addAll({'availability_status': 'false'});
      requestList.add(mapData);
    }
    log('request:$requestList');

    await _controller.addAvailability(requestList);
    if (_controller.addAvailabilityApiResponse.value == Status.COMPLETE) {
      Get.showSnackbar(GetBar(
        message: 'Availability Saved Successfully',
        duration: Duration(seconds: 2),
      ));
      Future.delayed(Duration(seconds: 3), () {
        Get.back();
      });
    } else {
      Get.showSnackbar(GetBar(
        message: 'Save availability field please try again',
        duration: Duration(seconds: 2),
      ));
    }
  }

  String setWeekIndex(String day) {
    if (day == 'Sunday') {
      return '0';
    } else if (day == 'Monday') {
      return '1';
    } else if (day == 'Tuesday') {
      return '2';
    } else if (day == 'Wednesday') {
      return '3';
    } else if (day == 'Thursday') {
      return '4';
    } else if (day == 'Friday') {
      return '5';
    } else {
      return '6';
    }
  }
}
