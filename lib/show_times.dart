import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'Utils/Colors.dart';

class ShowTimes extends StatefulWidget {
  final List<DateTime> dates;
  final DateTime selectedTimeFrom;
  final DateTime selectedTimeTo;
  final bool breakTime;
  final Map<String, bool> statusMap;

  const ShowTimes(
      {Key key,
      this.dates,
      this.selectedTimeFrom,
      this.selectedTimeTo,
      this.breakTime,
      this.statusMap})
      : super(key: key);

  @override
  _ShowTimesState createState() => _ShowTimesState();
}

class _ShowTimesState extends State<ShowTimes> {
  Map<String, bool> statusMap = {};

  ShowTimesController _controller = Get.find();
  DateTime now = DateTime.now();
  List<DateTime> dateList = <DateTime>[];
  List<DateTime> oldDateList = <DateTime>[];
  List<String> deletedDay = [];

  @override
  void initState() {
    super.initState();
    _controller.setIsDeleteStatus(false);
    _controller.clearDeleteStatusMap();
    oldDateList = widget.dates;
    // statusMap = widget.statusMap;
    print('INIT:$statusMap');
    setDateList();
  }

  void setDateList() {
    int totalDays = DateTime(now.year, now.month + 1, 0).day;

    int everyDayCount = 0;
    int sundayCount = dayCount('Sunday');
    int mondayCount = dayCount('Monday');
    int tuesdayCount = dayCount('Tuesday');
    int wednesdayCount = dayCount('Wednesday');
    int thursdayCount = dayCount('Thursday');
    int fridayCount = dayCount('Friday');
    int saturdayCount = dayCount('Saturday');
    for (int index = 1; index <= totalDays; index++) {
      DateTime date = DateTime(now.year, now.month, index);
      dateList.add(date);
      int availableStatus = widget.dates
          .indexWhere((element) => element.difference(date).inDays == 0);
      if (availableStatus != -1) {
        everyDayCount++;
      }
    }
    int currentSundayCount = dayCount('Sunday', dates: dateList);
    int currentMondayCount = dayCount('Monday', dates: dateList);
    int currentTuesdayCount = dayCount('Tuesday', dates: dateList);
    int currentWednesdayCount = dayCount('Wednesday', dates: dateList);
    int currentThursdayCount = dayCount('Thursday', dates: dateList);
    int currentFridayCount = dayCount('Friday', dates: dateList);
    int currentSaturdayCount = dayCount('Saturday', dates: dateList);
    if (totalDays == everyDayCount) {
      statusMap.addAll({'EVERYDAY': statusMap['EVERYDAY'] ?? false});
      return;
    }
    String day = '';
    if (sundayCount == currentSundayCount) {
      day = day + 'SUNDAY ,';
    } else {
      setDateInMap('Sunday');
    }
    if (mondayCount == currentMondayCount) {
      day = day + 'MONDAY , ';
    } else {
      setDateInMap('Monday');
    }
    if (tuesdayCount == currentTuesdayCount) {
      day = day + 'TUESDAY , ';
    } else {
      setDateInMap('Tuesday');
    }
    if (wednesdayCount == currentWednesdayCount) {
      day = day + 'WEDNESDAY , ';
    } else {
      setDateInMap('Wednesday');
    }
    if (thursdayCount == currentThursdayCount) {
      day = day + 'THURSDAY , ';
    } else {
      setDateInMap('Thursday');
    }
    if (fridayCount == currentFridayCount) {
      day = day + 'FRIDAY , ';
    } else {
      setDateInMap('Friday');
    }
    if (saturdayCount == currentSaturdayCount) {
      day = day + 'SATURDAY , ';
    } else {
      setDateInMap('Saturday');
    }
    if (day != '') {
      String key = day.substring(0, day.lastIndexOf(',') - 1);
      print('key:$key');
      print('statusMap[key]:${statusMap} ${widget.statusMap}');
      statusMap.addAll({key: widget.statusMap[key] ?? false});
    }
    setState(() {});
  }

  String days(
    DateTime date,
  ) {
    return DateFormat('EEEE').format(date);
  }

  void setDateInMap(
    String day,
  ) {
    widget.dates.forEach((element) {
      if (days(element) == day) {
        statusMap.addAll({
          DateFormat('dd-MM-yyyy').format(element):
              widget.statusMap[DateFormat('dd-MM-yyyy').format(element)] ??
                  false
        });
      }
    });
  }

  int dayCount(String day, {List<DateTime> dates}) {
    return (dates ?? widget.dates).fold(
        0,
        (previousValue, element) =>
            previousValue + (days(element) == day ? 1 : 0));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back(result: {
          'statusMap': statusMap,
          'dates': widget.dates,
          'deletedDays': deletedDay
        });
        return Future.value(
          true,
        );
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: customAppbar(context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(backgroundColorBlue),
            child: Icon(Icons.add),
            onPressed: () {
              Get.back(result: {
                'statusMap': statusMap,
                'dates': widget.dates,
                'deletedDays': deletedDay
              });
            },
          ),
          body: GestureDetector(
            onTap: () {
              _controller.setIsDeleteStatus(false);
            },
            child: GetBuilder<ShowTimesController>(
              builder: (controller) {
                return ListView(
                  children: statusMap.keys
                      .toList()
                      .map((e) => ListTile(
                            title: Text(
                                '${DateFormat.jm().format(widget.selectedTimeFrom)} - ${DateFormat.jm().format(widget.selectedTimeTo)}'),
                            trailing: controller.isDeleteStatus.value
                                ? Checkbox(
                                    value: controller.deleteStatusMap.isEmpty
                                        ? false
                                        : !controller.deleteStatusMap
                                                .containsKey(e)
                                            ? false
                                            : controller
                                                .deleteStatusMap.value[e],
                                    onChanged: (value) {
                                      _controller
                                          .setDeleteStatusMap({e: value});
                                    },
                                  )
                                : CupertinoSwitch(
                                    value: statusMap[e],
                                    onChanged: (value) {
                                      setState(() {
                                        statusMap.addAll({e: value});
                                      });
                                    },
                                  ),
                            subtitle: Text(e.replaceAll('DAY', '')),
                          ))
                      .toList(),
                );
              },
            ),
          )),
    );
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
            Get.back(result: {
              'statusMap': statusMap,
              'dates': widget.dates,
              'deletedDays': deletedDay
            });
          },
          child: Icon(Icons.arrow_back_ios_rounded,
              color: Color(backgroundColorBlue))),
      actions: [
        GetBuilder<ShowTimesController>(
          builder: (controller) {
            return statusMap.isEmpty
                ? SizedBox()
                : !controller.isDeleteStatus.value
                    ? deleteIcon()
                    : deleteTextBtn(controller);
          },
        )
      ],
    );
  }

  Widget deleteTextBtn(ShowTimesController controller) {
    return TextButton(
      onPressed: () {
        controller.deleteStatusMap.value.forEach((key, value) {
          print('key:$key');
          print('contain:${key.contains('THURSDAY')}');
          if (key.contains('SUNDAY') ||
              key.contains('MONDAY') ||
              key.contains('TUESDAY') ||
              key.contains('WEDNESDAY') ||
              key.contains('THURSDAY') ||
              key.contains('FRIDAY') ||
              key.contains('SATURDAY')) {
            for (int index = 0; index < oldDateList.length; index++) {
              print(
                  'match:${days(oldDateList[index]) == 'THURSDAY'} day:${days(oldDateList[index])} ');
              if (days(oldDateList[index]).toUpperCase() == 'SUNDAY' ||
                  days(oldDateList[index]).toUpperCase() == 'MONDAY' ||
                  days(oldDateList[index]).toUpperCase() == 'TUESDAY' ||
                  days(oldDateList[index]).toUpperCase() == 'WEDNESDAY' ||
                  days(oldDateList[index]).toUpperCase() == 'THURSDAY' ||
                  days(oldDateList[index]).toUpperCase() == 'FRIDAY' ||
                  days(oldDateList[index]).toUpperCase() == 'SATURDAY') {
                print('oldDateList[index]:${oldDateList[index]}');
                oldDateList.remove(oldDateList[index]);
              }
            }
          } else {
            int index = oldDateList.indexWhere(
                (element) => key == DateFormat('dd-MM-yyyy').format(element));
            if (index > -1) {
              oldDateList.removeAt(index);
            }
          }
          print('value:$value , key:$key');
          if (value) {
            deletedDay.add(key);
            statusMap.remove(key);
          }
        });
        setState(() {});
        _controller.setIsDeleteStatus(false);
      },
      child: Text(
        "Delete",
        style: TextStyle(
            color: Color(backgroundColorBlue), fontWeight: FontWeight.w600),
      ),
    );
  }

  IconButton deleteIcon() {
    return IconButton(
        onPressed: () {
          _controller.setIsDeleteStatus(true);
        },
        icon: Icon(
          Icons.delete_outline,
          color: Colors.grey[700],
        ));
  }
}

class ShowTimesController extends GetxController {
  RxBool _isDeleteStatus = false.obs;

  RxBool get isDeleteStatus => _isDeleteStatus;

  void setIsDeleteStatus(bool value) {
    _isDeleteStatus = value.obs;
    update();
  }

  RxMap<String, bool> _deleteStatusMap = <String, bool>{}.obs;

  RxMap<String, bool> get deleteStatusMap => _deleteStatusMap;

  void setDeleteStatusMap(Map<String, bool> value) {
    _deleteStatusMap.addAll(value);
    update();
  }

  void clearDeleteStatusMap() {
    _deleteStatusMap.clear();
    update();
  }
/* RxMap<String, bool> _switchStatusMap = <String, bool>{}.obs;

  RxMap<String, bool> get switchStatusMap => _switchStatusMap;

  void setSwitchStatusMap(Map<String, bool> value) {
    _switchStatusMap.addAll(value);
    update();
  }

  void clearSwitchStatusMap() {
    _switchStatusMap.clear();
    update();
  }*/
}
