import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mental_health/Utils/Colors.dart';

class Availability extends StatefulWidget {
  final List<DateTime> dates;
  final DateTime selectedTimeFrom;
  final DateTime selectedTimeTo;
  final bool breakTime;
  final Map<String, bool> statusMap;

  const Availability(
      {Key key,
      this.dates,
      this.selectedTimeFrom,
      this.selectedTimeTo,
      this.breakTime,
      this.statusMap})
      : super(key: key);

  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
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
    print('web:${tuesdayCount} $currentTuesdayCount ');
    if (totalDays == everyDayCount) {
      statusMap.addAll({'EVERYDAY': statusMap['EVERYDAY'] ?? false});
      return;
    }
    if (sundayCount == currentSundayCount) {
      statusMap.addAll({'SUNDAY': widget.statusMap['SUNDAY'] ?? false});
    } else {
      setDateInMap('Sunday');
    }
    if (mondayCount == currentMondayCount) {
      statusMap.addAll({'MONDAY': widget.statusMap['MONDAY'] ?? false});
    } else {
      setDateInMap('Monday');
    }
    if (tuesdayCount == currentTuesdayCount) {
      statusMap.addAll({'TUESDAY': widget.statusMap['TUESDAY'] ?? false});
    } else {
      setDateInMap('Tuesday');
    }
    if (wednesdayCount == currentWednesdayCount) {
      statusMap.addAll({'WEDNESDAY': widget.statusMap['WEDNESDAY'] ?? false});
    } else {
      setDateInMap('Wednesday');
    }
    if (thursdayCount == currentThursdayCount) {
      statusMap.addAll({'THURSDAY': widget.statusMap['THURSDAY'] ?? false});
    } else {
      setDateInMap('Thursday');
    }
    if (fridayCount == currentFridayCount) {
      statusMap.addAll({'FRIDAY': widget.statusMap['FRIDAY'] ?? false});
    } else {
      setDateInMap('Friday');
    }
    if (saturdayCount == currentSaturdayCount) {
      statusMap.addAll({'SATURDAY': widget.statusMap['SATURDAY'] ?? false});
    } else {
      setDateInMap('Saturday');
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
          'dates': oldDateList,
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
                'dates': oldDateList,
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
              'dates': oldDateList,
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
          if (key == 'SUNDAY' ||
              key == 'MONDAY' ||
              key == 'TUESDAY' ||
              key == 'WEDNESDAY' ||
              key == 'THURSDAY' ||
              key == 'FRIDAY' ||
              key == 'SATURDAY') {
            List<DateTime> deletedDate = [];
            for (int index = 0; index < widget.dates.length; index++) {
              if (days(widget.dates[index]).toUpperCase() == key) {
                deletedDate.add(widget.dates[index]);
              }
            }

            oldDateList = oldDateList
                .where((element) => !deletedDate.contains(element))
                .toList();
          } else {
            int index = widget.dates.indexWhere(
                (element) => key == DateFormat('dd-MM-yyyy').format(element));
            if (index > -1) {
              oldDateList.removeAt(index);
            }
          }
          if (value) {
            deletedDay.add(key.trim());
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
