import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/controller/availability_controller.dart';
import 'package:mental_health/models/availabilityModel.dart';
import 'package:mental_health/models/avalabilitymodel.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AvailabilityFirst.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  DateTime selectedTimeFrom;
  DateTime selectedTimeTo;
  ShowTimesController _controller = Get.find();

  @override
  void initState() {
    super.initState();
    _controller.setIsDeleteStatus(false);
    _controller.clearDeleteStatus();
    _controller.clearRadioStatus();
    _controller.getAvailability();
  }

  String setData(Map<String, dynamic> d, List<Map<String, dynamic>> allData) {
    String firstDate;
    String lastDate;
    int length =
        allData.where((element) => element['status'] == '1').toList().length;
    Map<int, int> data = {};
    for (int index = 0; index < length; index++) {
      for (var i = 0; i < 48; i++) {
        if (d.keys.toList().contains('$i')) {
          data.addAll(
              {i: int.parse(d.values.toList()[d.keys.toList().indexOf('$i')])});
        }
      }
    }
    print('D:$data');
    for (var i = 0; i < 48; i++) {
      if (data[i] == 1) {
        int value = data.keys.toList()[i];
        if (value % 2 == 0) {
          firstDate = '${(value / 2).ceil()}:00';
        } else {
          firstDate = '${(value / 2).ceil() - 1}:30';
        }
        if (value > 24) {
          firstDate = firstDate + ' PM';
        } else {
          firstDate = firstDate + ' AM';
        }
        break;
      }
    }
    for (var i = 47; i > 0; i--) {
      if (data[i] == 1) {
        int value = data.keys.toList()[i];
        if (value % 2 == 0) {
          lastDate = '${(value / 2).ceil()}:00';
        } else {
          lastDate = '${(value / 2).ceil() - 1}:30';
        }
        if (value > 24) {
          lastDate = lastDate + ' PM';
        } else {
          lastDate = lastDate + ' AM';
        }
        break;
      }
    }
    return '$firstDate - $lastDate';
  }

  String setWeekDay(String day) {
    if (day == '0') {
      return 'Sunday';
    } else if (day == '1') {
      return 'Monday';
    } else if (day == '2') {
      return 'Tuesday';
    } else if (day == '3') {
      return 'Wednesday';
    } else if (day == '4') {
      return 'Thursday';
    } else if (day == '5') {
      return 'Friday';
    } else {
      return 'Saturday';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppbar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(backgroundColorBlue),
          child: Icon(Icons.add),
          onPressed: () async {
            List<Map<String, String>> response = [];
            if (_controller.getAvailabilityApiResponse.value ==
                Status.COMPLETE) {
              response = _controller.getAvailabilityData.value.availability
                  .where((element) => element['status'] == '1')
                  .toList();
            }
            Get.to(AvailabilityFirst(
              response: response,
            ));
          },
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: GestureDetector(
            onTap: () {
              _controller.setIsDeleteStatus(false);
            },
            child: GetBuilder<ShowTimesController>(
              builder: (controller) {
                if (controller.getAvailabilityApiResponse.value ==
                    Status.LOADING) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (controller.getAvailabilityApiResponse.value ==
                    Status.ERROR) {
                  return Center(child: Text('Data not found'));
                }

                if (controller.getAvailabilityData.value.availability.isEmpty) {
                  return Center(child: Text('Data not found'));
                }
                AvailabiltiyModel response =
                    controller.getAvailabilityData.value;
                log('STATUS...:${response.availability}');
                return Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      height: Get.height,
                      width: Get.width,
                      child: ListView(
                        children: response.availability
                            .map((e) => e['status'] == '0'
                                ? SizedBox()
                                : ListTile(
                                    title: Text(
                                      '${e['format']}',
                                      // '${setData(e, response.availability)}'
                                      // '${DateFormat.jm().format(selectedTimeFrom)} - ${DateFormat.jm().format(selectedTimeTo)}'
                                    ),
                                    trailing: controller.isDeleteStatus.value
                                        ? Checkbox(
                                            value: controller
                                                    .deleteStatusList.isEmpty
                                                ? false
                                                : controller.deleteStatusList
                                                    .contains(e['id']),
                                            onChanged: (value) {
                                              _controller
                                                  .setDeleteStatusMap(e['id']);
                                            },
                                          )
                                        : CupertinoSwitch(
                                            value:
                                                e['availability_status'] == "1"
                                                    ? true
                                                    : false,
                                            activeColor:
                                                Color(backgroundColorBlue),
                                            onChanged: (value) {
                                              _controller.setRadioStatusList(
                                                  value: value ? '1' : '0',
                                                  index: response.availability
                                                      .indexOf(e));
                                              changeSwitchStatus([e]);
                                            },
                                          ),
                                    subtitle: Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                "${setWeekDay(e['weekday'])}")),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            "${'Break Time : ' + (e['break'] == "0" ? '00 Min' : "30 Min")}",
                                            style: TextStyle(color: cadetBlue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                            .toList(),
                      ),
                    ),
                    // controller.addAvailabilityApiResponse.value ==
                    //         Status.LOADING
                    //     ? Container(
                    //         height: Get.height,
                    //         width: Get.width,
                    //         child: Center(
                    //           child: CircularProgressIndicator(),
                    //         ),
                    //         color: Colors.black38,
                    //       )
                    //     : SizedBox()
                  ],
                );
              },
            ),
          ),
        ));
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
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_rounded,
              color: Color(backgroundColorBlue))),
      actions: [
        GetBuilder<ShowTimesController>(
          builder: (controller) {
            return !controller.isDeleteStatus.value
                ? deleteIcon()
                : deleteTextBtn();
          },
        )
      ],
    );
  }

  Widget deleteTextBtn() {
    return TextButton(
      onPressed: () async {
        print('DELETE:${_controller.deleteStatusList.value}');
        if (_controller.deleteStatusList.value.isEmpty) {
          return;
        }
        var requestList = _controller.getAvailabilityData.value.availability
            .where((element) =>
                _controller.deleteStatusList.value.contains(element['id']))
            .toList();
        requestList.forEach((element) {
          element['status'] = '0';
        });
        print('DATA:$requestList');

        await _controller.addAvailability(requestList);
        if (_controller.addAvailabilityApiResponse.value == Status.COMPLETE) {
          // Get.showSnackbar(GetBar(
          //   message: 'Availability Delete Successfully',
          //   duration: Duration(seconds: 2),
          // ));
          Future.delayed(Duration(seconds: 3), () {
            _controller.clearDeleteStatus();
            _controller.setIsDeleteStatus(false);
          });
        } else {
          requestList.forEach((element) {
            element['status'] = '1';
          });
          Get.showSnackbar(GetBar(
            message: 'Delete availability failed please try again',
            duration: Duration(seconds: 2),
          ));
        }
      },
      child: Text(
        "Delete",
        style: TextStyle(
            color: Color(backgroundColorBlue), fontWeight: FontWeight.w600),
      ),
    );
  }

  Future<void> changeSwitchStatus(List<Map<String, dynamic>> req) async {
    await _controller.addAvailability(req);
    if (_controller.addAvailabilityApiResponse.value == Status.COMPLETE) {
      Get.showSnackbar(GetBar(
        message: 'Availability Status Updated Successfully',
        duration: Duration(seconds: 2),
      ));
      Future.delayed(Duration(seconds: 3), () {
        _controller.clearDeleteStatus();
        _controller.setIsDeleteStatus(false);
      });
    } else {
      Get.showSnackbar(GetBar(
        message: 'Status Updated availability failed please try again',
        duration: Duration(seconds: 2),
      ));
    }
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
