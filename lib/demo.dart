import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'Utils/Colors.dart';
import 'Utils/SizeConfig.dart';
import 'show_times.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  Map<String, bool> statusMap = {};
  List<String> dayList = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  List<DateTime> selectedDates = <DateTime>[DateTime.now()];
  List<String> selectedDays = <String>[];
  DateRangePickerController controller = DateRangePickerController();
  DateTime now = DateTime.now();
  DateTime selectedTimeFrom = DateTime.now();
  DateTime selectedTimeTo = DateTime.now();
  RxBool breakTime = false.obs;
  RxBool isExpanded = true.obs;

  @override
  void initState() {
    super.initState();
    controller.selectedDates = [now];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              : SfDateRangePicker(
                  controller: controller,
                  showNavigationArrow: true,
                  view: DateRangePickerView.month,
                  headerStyle: DateRangePickerHeaderStyle(
                      textAlign: TextAlign.center,
                      textStyle: fromToHeaderStyle()),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Color(backgroundColorBlue),
                  selectionMode: DateRangePickerSelectionMode.multiple,
                  onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                    List<DateTime> list =
                        dateRangePickerSelectionChangedArgs.value;
                    list.forEach((element) {
                      int index = selectedDates
                          .indexWhere((e) => e.difference(element).inDays == 0);
                      if (index == -1) {
                        selectedDates.add(element);
                      }
                    });
                  },
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
            print("before statusMap:$statusMap");
            var data = await Get.to(ShowTimes(
              dates: controller.selectedDates,
              selectedTimeFrom: selectedTimeFrom,
              selectedTimeTo: selectedTimeTo,
              breakTime: breakTime.value,
              statusMap: statusMap,
            ));
            statusMap = data['statusMap'];
            selectedDates = data['dates'];

            controller.selectedDates = selectedDates;
            setState(() {});
            print("after statusMap:$data");
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
      print('time:${dateTime.difference(selectedTimeFrom).inMinutes}');

      if (dateTime.difference(selectedTimeFrom).inMinutes < 0) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please Select Greater than From Time')));
        return;
      }
      setState(() {
        selectedTimeTo =
            DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
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
      print('time:${dateTime.difference(selectedTimeTo).inMinutes}');

      if (dateTime.difference(selectedTimeTo).inMinutes > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please Select Less than To Time')));
        return;
      }
      setState(() {
        selectedTimeFrom =
            DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      });
    }
  }
}
