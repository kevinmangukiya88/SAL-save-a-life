import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'avialllll.dart';

class Availablitytest extends StatefulWidget {
  var boolval;
  var time;
  // var date;
  var dif;
  var endtime;
  dynamic days;
  Availablitytest(
      {this.boolval,
      this.time,
      this.endtime,
      this.dif,
      /*this.date,*/ this.days});
  @override
  _AvailablitytestState createState() => _AvailablitytestState();
}

class _AvailablitytestState extends State<Availablitytest> {
  List<int> switchValue = [];
  List<bool> switchtrue = [];
  List<String> weekday = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

  var list1 = [
    "00:00-01:00",
    "01:00-02:00",
    "02:00-03:00",
    "03:00-04:00",
    "04:00-05:00",
    "05:00-06:00",
    "06:00-07:00",
    "07:00-08:00",
    "08:00-09:00",
    "09:00-10:00",
    "10:00-11:00",
    "11:00-12:00",
    "12:00-13:00",
    "13:00-14:00",
    "14:00-15:00",
    "15:00-16:00",
    "16:00-17:00",
    "17:00-18:00",
    "18:00-19:00",
    "19:00-20:00",
    '20:00-21:00',
    "21:00-22:00",
    "22:00-23:00",
    "23:00-24:00"
  ];
  List<String> finalslots = [];
  var timesss = [];
  var list2 = [
    "00:00-01:00",
    "01:30-02:30",
    "03:00-04:00",
    "04:30-05:30",
    "06:00-07:00",
    "07:30-08:30",
    "09:00-10:00",
    "10:30-11:30",
    "12:00-13:00",
    "13:30-14:30",
    "15:00-16:00",
    "16:30-17:30",
    "18:00-19:00",
    "19:30-20:30",
    "21:00-22:00",
    '22:30-23:30',
  ];
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(_selectedIndex);
  }

  var list3 = [];
  var getslots = [];
  var list4 = [];
  void initState() {
    print("kjhsdvjsreon");
    print(widget.days);
    print(widget.time.toString().split(":")[0]);
    print(widget.endtime);
    print('boolvalue:${widget.boolval}');
    if (widget.boolval == true) {
      getNextLargerNumberbreak();
    } else {
      getNextLargerNumber();
    }
  }

  void getNextLargerNumber() {
    for (int i = 0; i < list1.length; i++) {
      print('hello' + list1[i].toString().split("-")[0].split(":")[0]);
      timesss.add(list1[i].toString().split("-")[0].split(":")[0] +
          ":" +
          list1[i].toString().split("-")[0].split(":")[1] +
          "-" +
          list1[i].toString().split("-")[1].split(":")[0] +
          ":" +
          list1[i].toString().split("-")[0].split(":")[1]);
    }
    print(timesss);

    getvalueof();
  }

  void getvalueof() {
    print("hauii");
    for (int j = 0; j < timesss.length; j++) {
      if (int.parse(widget.time.toString().split(":")[0]) <=
              int.parse(timesss[j].toString().split(":")[0].split("-")[0]) &&
          int.parse(timesss[j].toString().split(":")[0].split("-")[0]) <
              int.parse(widget.endtime.toString().split(":")[0])) {
        print("uhweuii" +
            int.parse(timesss[j].toString().split(":")[0].split("-")[0])
                .toString() +
            ":" +
            timesss[j].toString().split(":")[1].split("-")[0] +
            "-" +
            (int.parse(timesss[j].toString().split(":")[0].split("-")[0]) + 1)
                .toString() +
            ":" +
            timesss[j].toString().split(":")[1].split("-")[0]);
        finalslots.add(
            int.parse(timesss[j].toString().split(":")[0].split("-")[0])
                    .toString() +
                ":" +
                timesss[j].toString().split(":")[1].split("-")[0] +
                "-" +
                (int.parse(timesss[j].toString().split(":")[0].split("-")[0]) +
                        1)
                    .toString() +
                ":" +
                timesss[j].toString().split(":")[1].split("-")[0]);
      }
    }
  }

  Future<void> getNextLargerNumberbreak() async {
    for (int i = 0; i < list2.length; i++) {
      print(list2[i].toString().split("-")[0].split(":")[0]);
      timesss.add(list2[i].toString().split("-")[0].split(":")[0] +
          ":" +
          list2[i].toString().split("-")[0].split(":")[1] +
          "-" +
          list2[i].toString().split("-")[1].split(":")[0] +
          ":" +
          list2[i].toString().split("-")[0].split(":")[1]);
    }
    print(timesss);

    getvalueofbreak();
  }

  Future<void> getvalueofbreak() async {
    print("hauii");
    for (int j = 0; j < list2.length; j++) {
      print('val1 : ${int.parse(widget.time.toString().split(":")[0])}');
      print(
          'val2 : ${int.parse(list2[j].toString().split(":")[0].split("-")[0])}');
      print(
          'val3 : ${int.parse(list2[j].toString().split(":")[0].split("-")[0])}');
      print('val4 : ${int.parse(widget.endtime.toString().split(":")[0])}');
      if (int.parse(widget.time.toString().split(":")[0]) <=
              int.parse(list2[j].toString().split(":")[0].split("-")[0]) &&
          int.parse(list2[j].toString().split(":")[0].split("-")[0]) <
              int.parse(widget.endtime.toString().split(":")[0])) {
        print("uhweuii" +
            int.parse(list2[j].toString().split(":")[0].split("-")[0])
                .toString() +
            ":" +
            list2[j].toString().split(":")[1].split("-")[0] +
            "-" +
            (int.parse(list2[j].toString().split(":")[0].split("-")[0]) + 1)
                .toString() +
            ":" +
            list2[j].toString().split(":")[1].split("-")[0]);
        finalslots.add(
            int.parse(list2[j].toString().split(":")[0].split("-")[0])
                    .toString() +
                ":" +
                list2[j].toString().split(":")[1].split("-")[0] +
                "-" +
                (int.parse(list2[j].toString().split(":")[0].split("-")[0]) + 1)
                    .toString() +
                ":" +
                list2[j].toString().split(":")[1].split("-")[0]);
        switchValue = List.generate(finalslots.length, (index) => 1);
        switchtrue = List.generate(finalslots.length, (index) => true);
      }
    }
    //   SharedPreferences prefs= await SharedPreferences.getInstance();
  }

  bool showDelete = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (widget.boolval == false) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "Availability",
              style: TextStyle(color: Color(midnightBlue)),
            ),
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_rounded,
                    color: Color(midnightBlue))),
            actions: [
              Container(
                margin:
                    EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
                child: showDelete == false
                    ? ImageIcon(
                        AssetImage('assets/icons/delete.png'),
                        color: Color(fontColorGray),
                        size: SizeConfig.blockSizeVertical * 2,
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Delete",
                          style: TextStyle(
                              color: Color(backgroundColorBlue),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Color(backgroundColorBlue),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: ListView(children: getvalues()));
    } else {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Color(backgroundColorBlue),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "Availability",
              style: TextStyle(color: Color(midnightBlue)),
            ),
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_rounded,
                    color: Color(midnightBlue))),
            actions: [
              Container(
                margin:
                    EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
                child: showDelete == false
                    ? ImageIcon(
                        AssetImage('assets/icons/delete.png'),
                        color: Color(fontColorGray),
                        size: SizeConfig.blockSizeVertical * 2,
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Delete",
                          style: TextStyle(
                              color: Color(backgroundColorBlue),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
              ),
            ],
          ),
          body: ListView(
            children: getvalues2(),
          ));
    }
  }

  List<Widget> getvalues() {
    setState(() {
      //  isloading = true;
    });
    bool switchvalue = false;

    List<Widget> productList = new List();
    print('data:${finalslots.length}');
    for (int i = 0; i < finalslots.length; i++) {
      productList.add(avialll(
        time: finalslots[i],
        id: finalslots[i],
        subtitle: widget.days,
        switche: true,
      ));
    }
    return productList;
  }

  bool swsd = true;
  int index;
  List<Widget> getvalues2() {
    setState(() {
      //  isloading = true;
    });

    print("switchValue");
    List<Widget> productList = new List();
    for (int i = 0; i < finalslots.length; i++) {
      setState(() {
        index = i;
      });
      print(finalslots[i]);
      productList.add(valueof(
        time: finalslots[i],
        index: i,
        subtitle: widget.days,
        sw: switchtrue[i],
      ));
    }
    return productList;
  }

  Widget valueof({time, subtitle, sw, index}) {
    return Container(
        width: SizeConfig.screenWidth,
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.02,
            vertical: SizeConfig.blockSizeVertical),
        child: ListTile(
            tileColor: sw == true ? Colors.white : Color(0XFFF8F8F8),
            title: Text(
              time,
              style: TextStyle(fontSize: 14),
            ),
            subtitle: Row(
              children: getdays(),
            ),
            dense: true,
            trailing: Switch(
              value: switchtrue[index],
              onChanged: (value) {
                setState(() {
                  _onSelected(index);
                  print(index);
                  print("_selectedIndex");
                  print(_selectedIndex);
                });
                if (_selectedIndex != null && _selectedIndex == index) {
                  print("jihqwi");
                  setState(() {
                    switchtrue[index] = value;
                    if (switchtrue[index] == true) {
                      setState(() {
                        swsd = value;
                        switchValue[index] = 1;
                      });
                      print(switchValue);
                    } else {
                      setState(() {
                        swsd = value;
                        switchValue[index] = 0;
                      });
                      print(switchValue);
                    }
                  });
                }
              },
              activeColor: Color(backgroundColorBlue),
              inactiveThumbColor: Color(fontColorGray),
              activeTrackColor: Color(0XFFDBE6F5),
              inactiveTrackColor: Color(0XFFD8DFE9),
            )));
  }

  List<Widget> getdays() {
    List<Widget> getlistdays = new List();
    for (int i = 0; i < widget.days.length; i++) {
      getlistdays.add(Text(weekday[widget.days[i]].toString()));
    }
    return getlistdays;
  }
}
