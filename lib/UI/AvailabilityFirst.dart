import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:date_util/date_util.dart';
import 'package:table_calendar/table_calendar.dart';

import 'AVailabitiytest.dart';

class AvailabilityFirst extends StatefulWidget {
  const AvailabilityFirst({Key key}) : super(key: key);

  @override
  _AvailabilityFirstState createState() => _AvailabilityFirstState();
}

class _AvailabilityFirstState extends State<AvailabilityFirst> {
  bool expanded = false;
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  List<bool> selected = [false, false, false, false, false, false, false];
  bool checked = false;

  String _setTime, _setDate;

  String _hourFrom, _minuteFrom, _timeFrom;
  String _hourTo, _minuteTo, _timeTo;

  String dateTimeFrom;
  String dateTimeTo;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTimeFrom = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay selectedTimeTo = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _timeToController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
        print(_dateController.text);
      });
  }

  Map<DateTime, List> _holidays = {};
  Map<DateTime, List> wednesday = {};
  Map<DateTime, List> monday = {};
  Map<DateTime, List> sunday = {};
  Map<DateTime, List> tuesday = {};
  Map<DateTime, List> thursday = {};
  Map<DateTime, List> friday = {};
  Map<DateTime, List> saturday = {};

  CalendarController _controller;
  var getvalue;
  var forwardvalue = [];

  Future<Null> _selectFromTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeFrom,
    );
    if (picked != null)
      setState(() {
        selectedTimeFrom = picked;
        _hourFrom = selectedTimeFrom.hour.toString();
        _minuteFrom = selectedTimeFrom.minute.toString();
        _timeFrom = _hourFrom + ' : ' + _minuteFrom;
        _timeController.text = _timeFrom;
        _timeController.text = formatDate(
            DateTime(
                2019, 08, 1, selectedTimeFrom.hour, selectedTimeFrom.minute),
            [hh, ':', nn, " ", am]).toString();
        print(_timeController.text);
      });
  }

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(_selectedIndex);
  }

  Future<Null> _selectToTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeTo,
    );
    if (picked != null)
      setState(() {
        selectedTimeTo = picked;
        _hourTo = selectedTimeTo.hour.toString();
        _minuteTo = selectedTimeTo.minute.toString();
        _timeTo = _hourTo + ' : ' + _minuteTo;
        _timeToController.text = _timeTo;
        _timeToController.text = formatDate(
            DateTime(2019, 08, 1, selectedTimeTo.hour, selectedTimeTo.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  var dateUtility = DateUtil();

  Widget _buildHolidays5Marker(date) {
    return Container(
        child: GestureDetector(
      onTap: () {
        setState(() {
          _onSelected(date.day);
          print(date.day);
        });
      },
      child: CircleAvatar(
        backgroundColor: _selectedIndex != null && _selectedIndex == date.day
            ? Colors.white
            : Color(backgroundColorBlue),
        child: (Align(
            alignment: Alignment.center,
            child: Text(DateTime.parse(date.toString()).day.toString(),
                style: TextStyle().copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: _selectedIndex != null && _selectedIndex == date.day
                        ? Colors.black
                        : Colors.white)))),
      ),
    ));
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return Container(
        // duration: const Duration(milliseconds: 300),
        width: 16.0,
        height: 16.0,
        child: Padding(
          padding: EdgeInsets.only(left: 6),
          child: Container(
            height: 20,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.only(top: 5, left: 5),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 5,
                    width: 5,
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ));
              },
              itemCount: events.length > 3 ? 3 : events.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ));
  }

  Widget calendar() {
    print("getvalue:$getvalue");
    var tableCalendar = TableCalendar(
      holidays: getvalue == 0
          ? sunday
          : getvalue == 1
              ? monday
              : getvalue == 2
                  ? tuesday
                  : getvalue == 3
                      ? wednesday
                      : getvalue == 4
                          ? thursday
                          : getvalue == 5
                              ? friday
                              : getvalue == 6
                                  ? saturday
                                  : _holidays,

      initialCalendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.sunday,

      availableGestures: AvailableGestures.all,
      calendarStyle: CalendarStyle(
        canEventMarkersOverflow: true,
        markersColor: Colors.white,
        weekdayStyle: TextStyle(color: Colors.red),
        todayColor: Color(backgroundColorBlue),
        todayStyle: TextStyle(color: Color(backgroundColorBlue), fontSize: 16),
        selectedColor: Colors.deepOrange[300],
        outsideWeekendStyle: TextStyle(color: Colors.white60),
        outsideStyle: TextStyle(color: Colors.white60),
        weekendStyle: TextStyle(color: Colors.white),
        renderDaysOfWeek: true,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        weekendStyle: TextStyle().copyWith(color: Colors.grey),
      ),

      /// onDaySelected:_onDaySelected(DateTime.now()),
      calendarController: _controller,
      events: _events,

      builders: CalendarBuilders(
        dayBuilder: (context, date, events) {
          return Container(
            height: 250,
            child: Column(
              children: [
                buildCell(Colors.white, date, Colors.black, "normal"),
              ],
            ),
          );
        },
        selectedDayBuilder: (context, date, _) {
          print("selected");

          //_fetchEvents();

          return GestureDetector(
            onTap: () {
              // print(date);
            },
            child: Container(
              child: buildCell(
                  Color(backgroundColorBlue), date, Colors.white, "Selected"),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          // print(date);

          return buildCell(Colors.white, date, Colors.black, "today");
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                bottom: 2,
                left: 0,
                right: 0,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            print(holidays);
            children.add(Positioned(
                top: 0, left: 0, right: 0, child: _buildHolidays5Marker(date)));
          }

          return children;
        },
      ),
      headerStyle: HeaderStyle(
        headerMargin: EdgeInsets.symmetric(vertical: 5),
        formatButtonVisible: false,
        decoration: BoxDecoration(
            //color: Colors.pink,
            border:
                Border(bottom: BorderSide(color: Color(backgroundColorBlue)))),
        centerHeaderTitle: true,
        leftChevronIcon: Icon(Icons.arrow_back_ios,
            size: 15, color: Color(backgroundColorBlue)),
        rightChevronIcon: Icon(Icons.arrow_forward_ios,
            size: 15, color: Color(backgroundColorBlue)),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: tableCalendar);
  }

  Widget eventTitle() {
    if (_selectedEvents.length == 0 || null) {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
        child: Text("No events",
            style: Theme.of(context).primaryTextTheme.headline1),
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child:
          Text("Events", style: Theme.of(context).primaryTextTheme.headline1),
    );
  }

  @override
  void initState() {
    _controller = CalendarController();
    mainss();
    //DateFormat('EEEE').format(date);
    var day1 = dateUtility.day(2);
    print(day1);
    var day2 = dateUtility.daysInMonth(2, 2018);
    print(day2);
    _dateController.text = DateTime.now().toString();

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();

    _timeToController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  var listOfDates = [];

  void mainss() {
    // Take the input year, month number, and pass it inside DateTime()
    var get = DateTime.now().month + DateTime.now().year;
    print(get);
    var now = DateTime(DateTime.now().year, DateTime.now().month);

    // Getting the total number of days of the month
    var totalDays = daysInMonth(now);

    // Stroing all the dates till the last date
    // since we have found the last date using generate
    listOfDates = new List<int>.generate(totalDays, (i) => i + 1);
    // print((listOfDates.toString()+"-"+ DateTime.now().month.toString()+"-"+DateTime.now().year.toString()).toString());

    hiei(listOfDates);
  }

// this returns the last date of the month using DateTime
  int daysInMonth(DateTime date) {
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    print(firstDayNextMonth);

    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  void hiei(arr) {
    print("klnako" + arr.length.toString());
    for (int i = 0; i < arr.length; i++) {
      print(arr[i].toString() +
          "-" +
          DateTime.now().month.toString() +
          "-" +
          DateTime.now().year.toString());
      print(arr[i].toString().length);
      if (arr[i].toString().length == 1) {
        print(DateFormat('EEEE').format(DateTime.parse(
            DateTime.now().year.toString() +
                "-" +
                "0" +
                DateTime.now().month.toString() +
                "-" +
                "0" +
                arr[i].toString())));
        var daysweek = DateFormat('EEEE').format(DateTime.parse(
            DateTime.now().year.toString() +
                "-" +
                "0" +
                DateTime.now().month.toString() +
                "-" +
                "0" +
                arr[i].toString()));
        if (daysweek == "Wednesday") {
          wednesday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              "0" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Sunday") {
          sunday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              "0" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Tuesday") {
          tuesday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              "0" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Friday") {
          friday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              "0" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Saturday") {
          saturday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              "0" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Thursday") {
          thursday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              "0" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Monday") {
          monday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              "0" +
              arr[i].toString())] = ["bdjhkcbid"];
        }
        // _holidays[DateTime.parse(DateTime.now().year.toString()+"-"+"0"+DateTime.now().month.toString()+"-"+"0"+arr[i].toString())]=["bdjhkcbid"];

      } else {
        var daysweek = DateFormat('EEEE').format(DateTime.parse(
            DateTime.now().year.toString() +
                "-" +
                "0" +
                DateTime.now().month.toString() +
                "-" +
                arr[i].toString()));
        if (daysweek == "Wednesday") {
          wednesday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Tuesday") {
          tuesday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Sunday") {
          sunday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Monday") {
          monday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Thursday") {
          thursday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Friday") {
          friday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              arr[i].toString())] = ["bdjhkcbid"];
        } else if (daysweek == "Saturday") {
          saturday[DateTime.parse(DateTime.now().year.toString() +
              "-" +
              "0" +
              DateTime.now().month.toString() +
              "-" +
              arr[i].toString())] = ["bdjhkcbid"];
        }
        // _holidays[DateTime.parse(DateTime.now().year.toString()+"-"+"0"+DateTime.now().month.toString()+"-"+arr[i].toString())]=["bdjhkcbid"];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dateTimeFrom = DateFormat.yMd().format(DateTime.now());
    dateTimeTo = DateFormat.yMd().format(DateTime.now());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Availability",
          style: TextStyle(color: Color(backgroundColorBlue)),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_rounded,
                color: Color(backgroundColorBlue))),
        actions: [
          InkWell(
            onTap: () {
              if (_timeController.text.contains("PM") &&
                  _timeToController.text.contains("PM")) {
                print(_timeController.text.substring(0, 5).split(":")[0]);
                var val = int.parse(
                        _timeController.text.substring(0, 5).split(":")[0]) +
                    12;
                var val2 = int.parse(
                    _timeController.text.substring(0, 5).split(":")[1]);
                var finalval = val.toString() +
                    ":" +
                    _timeController.text
                        .substring(0, 5)
                        .split(":")[1]
                        .toString();
                var valnext = int.parse(
                        _timeToController.text.substring(0, 5).split(":")[0]) +
                    12;
                var valnext2 = int.parse(
                    _timeToController.text.substring(0, 5).split(":")[1]);
                var finalvalnext = valnext.toString() +
                    ":" +
                    _timeToController.text
                        .substring(0, 5)
                        .split(":")[1]
                        .toString();
                // print(valnext.toString()+_timeToController.text.substring(0,5).split(":")[1].toString());
                // print("finalval++finalvalnext");
                // print(finalval+"-"+finalvalnext);
                // print((valnext)-(val));
                // print((valnext2)-(val2));
                print(_dateController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Availablitytest(
                            boolval: checked,
                            time: finalval,
                            dif: (valnext) - (val),
                            endtime: finalvalnext,
                            // date: selectedDate,
                            days: forwardvalue)));
              } else if (_timeController.text.contains("AM") &&
                  _timeToController.text.contains("AM")) {
                print(_timeController.text.substring(0, 5).split(":")[0]);
                var val = int.parse(
                    _timeController.text.substring(0, 5).split(":")[0]);
                var val2 = int.parse(
                    _timeController.text.substring(0, 5).split(":")[1]);
                var finalval = val.toString() +
                    ":" +
                    _timeController.text
                        .substring(0, 5)
                        .split(":")[1]
                        .toString();
                var valnext = int.parse(
                    _timeToController.text.substring(0, 5).split(":")[0]);
                var valnext2 = int.parse(
                    _timeToController.text.substring(0, 5).split(":")[1]);
                var finalvalnext = valnext.toString() +
                    ":" +
                    _timeToController.text
                        .substring(0, 5)
                        .split(":")[1]
                        .toString();
                // print(valnext.toString()+_timeToController.text.substring(0,5).split(":")[1].toString());
                // print("finalval++finalvalnext");
                // print(finalval+"-"+finalvalnext);
                // print((valnext)-(val));
                // print((valnext2)-(val2));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Availablitytest(
                            boolval: checked,
                            time: finalval,
                            dif: (valnext) - (val),
                            endtime: finalvalnext,
                            // date: selectedDate,
                            days: forwardvalue)));
              } else if (_timeController.text.contains("AM") &&
                  _timeToController.text.contains("PM")) {
                print("elseiheili" +
                    _timeController.text.substring(0, 5).split(":")[0]);
                var val = int.parse(
                        _timeController.text.substring(0, 5).split(":")[0]) -
                    12;
                print("jnaon;o" + val.toString());
                var val2 = int.parse(
                    _timeController.text.substring(0, 5).split(":")[1]);
                var finalval = val.toString() +
                    ":" +
                    _timeController.text
                        .substring(0, 5)
                        .split(":")[1]
                        .toString();
                var valnext = int.parse(
                        _timeToController.text.substring(0, 5).split(":")[0]) +
                    12;
                var valnext2 = int.parse(
                    _timeToController.text.substring(0, 5).split(":")[1]);
                var finalvalnext = valnext.toString() +
                    ":" +
                    _timeToController.text
                        .substring(0, 5)
                        .split(":")[1]
                        .toString();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Availablitytest(
                            boolval: checked,
                            time: finalval,
                            dif: (valnext) - (val),
                            endtime: finalvalnext,
                            // date: selectedDate,
                            days: forwardvalue)));
              } else {
                print("else" +
                    _timeController.text.substring(0, 5).split(":")[0]);
                var val = int.parse(
                        _timeController.text.substring(0, 5).split(":")[0]) +
                    12;
                var val2 = int.parse(
                    _timeController.text.substring(0, 5).split(":")[1]);
                var finalval = val.toString() +
                    ":" +
                    _timeController.text
                        .substring(0, 5)
                        .split(":")[1]
                        .toString();
                var valnext = int.parse(
                    _timeToController.text.substring(0, 5).split(":")[0]);
                var valnext2 = int.parse(
                    _timeToController.text.substring(0, 5).split(":")[1]);
                var finalvalnext = valnext.toString() +
                    ":" +
                    _timeToController.text
                        .substring(0, 5)
                        .split(":")[1]
                        .toString();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Availablitytest(
                            boolval: checked,
                            time: finalval,
                            dif: (valnext) - (val),
                            endtime: finalvalnext,
                            // date: selectedDate,
                            days: forwardvalue)));
              }
            },
            child: Container(
              margin:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Save",
                  style: TextStyle(
                      color: Color(backgroundColorBlue),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.02,
                vertical: SizeConfig.blockSizeVertical,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.02),
                          child: Text(
                            "FROM",
                            style: TextStyle(
                                color: Color(fontColorGray),
                                fontSize: SizeConfig.blockSizeVertical * 1.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _selectFromTime(context);
                          },
                          child: Container(
                            width: SizeConfig.screenWidth * 0.4,
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeVertical * 4,
                                  color: Color(midnightBlue)),
                              onSaved: (String val) {
                                _setTime = val;
                              },
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: _timeController,
                              decoration: InputDecoration(
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.02,
                          ),
                          child: Text(
                            "TO",
                            style: TextStyle(
                                color: Color(fontColorGray),
                                fontSize: SizeConfig.blockSizeVertical * 1.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _selectToTime(context);
                          },
                          child: Container(
                            width: SizeConfig.screenWidth * 0.4,
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeVertical * 4,
                                  color: Color(midnightBlue)),
                              onSaved: (String val) {
                                _setTime = val;
                              },
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: _timeToController,
                              decoration: InputDecoration(
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  // labelText: 'Time',
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _controller.toggleCalendarFormat();
                });
                // if(expanded == false)
                // setState(() {
                //   expanded = true;
                // });
                // else
                //   setState(() {
                //     expanded = false;
                //   });
              },
              child: Container(
                width: SizeConfig.screenWidth,
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.05,
                  vertical: SizeConfig.blockSizeVertical,
                ),
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
                    Icon(
                      expanded == false
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      color: Color(fontColorGray),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.05,
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.02,
                vertical: SizeConfig.blockSizeVertical,
              ),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MaterialButton(
                    onPressed: () {
                      if (selected[index] == false) {
                        setState(() {
                          selected[index] = true;
                          print([index]);
                          getvalue = index;
                          forwardvalue.add(index);
                        });
                      } else {
                        setState(() {
                          selected[index] = false;
                          forwardvalue.remove(index);
                        });
                      }
                      print('forwardvalue:$forwardvalue}');
                    },
                    child: Text(
                      days[index],
                      style: TextStyle(
                          color: selected[index] == true
                              ? Colors.white
                              : Color(0XFF383838)),
                    ),
                    color: selected[index] == true
                        ? Color(backgroundColorBlue)
                        : Colors.white,
                    minWidth: SizeConfig.screenWidth * 0.1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    elevation: 0.0,
                  );
                },
                itemCount: days.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            expanded == true
                ? CalendarDatePicker(
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                    initialCalendarMode: DatePickerMode.day,
                    onDateChanged: (date) {
                      setState(() {
                        selectedDate = date;
                        _dateController.text = selectedDate.toString();
                      });
                    })
                : SizedBox(
                    width: SizeConfig.screenWidth,
                  ),
            calendar(),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02,
                  vertical: SizeConfig.blockSizeVertical),
              child: CheckboxListTile(
                value: checked,
                onChanged: (value) {
                  setState(() {
                    checked = value;
                    print(checked);
                  });
                },
                title: Text("Provide 30 minutes break after each session"),
                dense: true,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Color(backgroundColorBlue),
                checkColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  // Widget _buildHolidays2Marker() {
  //   return Positioned(
  //       top: 0,
  //       left: 0,
  //       right: 0,
  //       child: _buildHolidays5Marker(
  //           DateTime.parse("2021-08-19")));
  // }
  Widget buildCell(Color color, DateTime date, textcolor, text) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(

            //  margin: EdgeInsets.only(top: 2.0, left: 4, right: 4, bottom: 10),
            //padding:  EdgeInsets.only( bottom: 3),
            // width: 100,
            //height: SizeConfig.screenHeight * 0.044,

            child: CircleAvatar(
          backgroundColor:
              text == "normal" ? Colors.white : Color(backgroundColorBlue),
          child: (Align(
              alignment: Alignment.center,
              child: Text('${date.day}',
                  style: TextStyle(
                      color: text == "today" ? Colors.white : textcolor,
                      fontSize: 16)))),
        )));
  }
}
