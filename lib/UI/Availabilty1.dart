import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/controller/availability_controller.dart';
import 'package:mental_health/models/availabilityModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AvailabilityFirst.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  List<String> selectedDays = <String>[];
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
            Get.to(AvailabilityFirst());
          },
        ),
        body: GestureDetector(
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
              if (controller.getAvailabilityApiResponse.value == Status.ERROR) {
                return Center(child: Text('Data not found'));
              }

              if (controller.getAvailabilityData.value.availability.isEmpty) {
                return Center(child: Text('Data not found'));
              }

              return ListView(
                children: selectedDays
                    .toList()
                    .map((e) => ListTile(
                          title: Text(
                              '${DateFormat.jm().format(selectedTimeFrom)} - ${DateFormat.jm().format(selectedTimeTo)}'),
                          trailing: controller.isDeleteStatus.value
                              ? Checkbox(
                                  value: controller.deleteStatusList.isEmpty
                                      ? false
                                      : controller.deleteStatusList.contains(e),
                                  onChanged: (value) {
                                    _controller.setDeleteStatusMap(e);
                                  },
                                )
                              : CupertinoSwitch(
                                  value: controller.radioStatusList.isEmpty
                                      ? false
                                      : controller.radioStatusList.contains(e),
                                  onChanged: (value) {
                                    _controller.setRadioStatusList(e);
                                  },
                                ),
                          subtitle: Text(e.toUpperCase()),
                        ))
                    .toList(),
              );
            },
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
                : deleteTextBtn(controller);
          },
        )
      ],
    );
  }

  Widget deleteTextBtn(ShowTimesController controller) {
    return TextButton(
      onPressed: () {
        // List<DateTime> deleteDates = [];
        // for (DateTime date in selectedDates) {
        //   if (controller.deleteStatusList.value
        //       .contains(DateFormat('EEEE').format(date))) {
        //     deleteDates.add(date);
        //   }
        // }
        for (String value in controller.deleteStatusList.value) {
          selectedDays.remove(value);
        }

        // selectedDates = selectedDates
        //     .where((element) => !deleteDates.contains(element))
        //     .toList();

        _controller.clearDeleteStatus();

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
