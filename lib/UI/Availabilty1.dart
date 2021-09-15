import 'package:flutter/material.dart';
import 'package:mental_health/UI/avialllll.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/data/repo/newavail.dart';
import 'package:mental_health/models/avalabilitymodel.dart';

class Availability extends StatefulWidget {
  const Availability({Key key}) : super(key: key);
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  AvailabiltiyModel availabiltiyModel;

  List arr = [];
  var moodstatic = [
    "00:00-00:30",
    "0:30-01:00",
    "01:00-1:30",
    "02:0-2.30",
    "02:30-3:00",
    "03:00-3:30",
    "03:30-4:00",
    "04:00-4:30",
    "04:30-5:00",
    "05:00-5:30",
    "05:30-6:00",
    "06:00-6:30",
    "06:30-7:00",
    "07:00-7:30",
    "08:00-8:30",
    "08:30-9:00",
    "09:00-9:30",
    "09:30-10:00",
    "10:00-10:30",
    "10:30-11:00",
    "11:00-11:30",
    "12:0-12.30",
    "12:30-13:00",
    "13:00-13:30",
    "13:30-14:00",
    "14:00-14:30",
    "14:30-15:00",
    "15:00-15:30",
    "15:30-16:00",
    "16:00-16:30",
    "16:30-17:00",
    "17:00-17:30",
    "18:00-18:30",
    "18:30-19:00",
    "19:00-19:30",
    "19:30-20:00",
    '20:00-20:30',
    '20:30-21:00',
    "21:00-21:30",
    "21:30-22:00",
    "22:00-22:30",
    "22:30-23:00",
    "23:00-23:30",
    "23:30-24:00"
  ];
  bool isloading = false;
  @override
  void initState() {
    final testMap = {"a": 1, "b": 2, "c": 3, "d": 4, "e": 5};
    for (final mapEntry in testMap.entries) {
      final key = mapEntry.key;
      final value = mapEntry.value;
      print(value); // Key: a, Value: 1 ...
    }
    getapi();
    //toast(value.meta.message);
    /*  SharedPreferencesTest().checkIsLogin("0");
                                          SharedPreferencesTest()
                                              .saveToken("set", value: value.token);*/

    //       /*  Navigator.push(context,
    //           MaterialPageRoute(
    //               builder: (conext) {
    //                 return OTPScreen(
    //                   phoneNumber: mobileController.text,
    //                 );
    //               }));*/
    //     } else {
    //       showAlertDialog(
    //         context,
    //         value.meta.message,
    //         "",
    //       );
    //     }
    //   } else {
    //     showAlertDialog(
    //       context,
    //       "No data found",
    //       "",
    //     );
    //   }
    // }).catchError((error) {
    //   showAlertDialog(
    //     context,
    //     error.toString(),
    //     "",
    //   );
    // });
    // TODO: implement initState
    //  getnotescount();

    //   for (final mapEntry in availabiltiyModel.availability[1].entries) {
    //   final key = mapEntry.key;
    //   final value = mapEntry.value;
    //   print('Key: $key, Value: $value');  // Key: a, Value: 1 ...
    // }
    super.initState();
  }

  List<String> time = [
    '12:00 - 17:00 PM',
    '12:00 - 17:00 PM',
    '17:00 - 19:00 PM',
    '17:00 - 19:00 PM'
  ];
  List<bool> switches = [true, true, false, false];
  List<String> day = [
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY' 'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY',
    'TOMORROW',
    'EVERYDAY',
    'SUN,MON,WED',
    'MONDAY'
  ];
  List<bool> selected = [false, false, false, false];

  bool selectedCheckbox = true;
  bool showDelete = false;

  bool switch1 = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
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
            child:
                Icon(Icons.arrow_back_ios_rounded, color: Color(midnightBlue))),
        actions: [
          Container(
            margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
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
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(backgroundColorBlue),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          isloading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getvalues(),
                    // children: [
                    //   Container(
                    //       width: SizeConfig.screenWidth,
                    //       margin: EdgeInsets.symmetric(
                    //           horizontal: SizeConfig.screenWidth * 0.02,
                    //           vertical: SizeConfig.blockSizeVertical),
                    //       child: ListView.builder(
                    //         itemBuilder: (BuildContext context, int index) {
                    //           return ListTile(
                    //               onLongPress: () {
                    //                 setState(() {
                    //                   selected[index] = true;
                    //                   showDelete = true;
                    //                 });
                    //               },
                    //               onTap: () {
                    //                 setState(() {
                    //                   selected[index] = false;
                    //                   showDelete = false;
                    //                 });
                    //               },
                    //               tileColor: selected[index] == false
                    //                   ? Colors.white
                    //                   : Color(0XFFF8F8F8),
                    //               title: Text(time[index]),
                    //               subtitle: Text(day[index]),
                    //               dense: true,
                    //               trailing: selected[index] == false
                    //                   ? Switch(
                    //                       value: switches[index],
                    //                       onChanged: (value) {
                    //                         setState(() {
                    //                           switches[index] = value;
                    //                         });
                    //                       },
                    //                       activeColor: Color(backgroundColorBlue),
                    //                       inactiveThumbColor: Color(fontColorGray),
                    //                       activeTrackColor: Color(0XFFDBE6F5),
                    //                       inactiveTrackColor: Color(0XFFD8DFE9),
                    //                     )
                    //                   : Checkbox(
                    //                       value: selectedCheckbox,
                    //                       onChanged: (value) {
                    //                         selectedCheckbox = value;
                    //                       }));
                    //         },
                    //         shrinkWrap: true,
                    //         physics: NeverScrollableScrollPhysics(),
                    //         itemCount: time.length,
                    //         primary: false,
                    //       )),
                    // ],
                  ),
                ),
        ],
      ),
    ));
  }

  List<Widget> getvalues() {
    setState(() {
      isloading = true;
    });
    bool switchvalue = false;
    bool sw = false;
    List<Widget> productList = new List();
    for (int i = 0; i < moodstatic.length; i++) {
      if (arr[i].toString() == "0") {
        setState(() {
          switchvalue = true;
        });
      } else {
        setState(() {
          switchvalue = false;
        });
      }
      productList.add(avialll(
        time: moodstatic[i],
        subtitle: day[i],
        switche: switchvalue,
      ));
    }
    return productList;
  }

  getapi() {
    isloading = true;
    AddedRelationListRepo.getAddRelationList().then((value) {
      if (value != null) {
        if (value.meta.status == "200") {
          setState(() {
            isloading = false;
          });
          availabiltiyModel = AvailabiltiyModel(
              availability: value.availability, meta: value.meta);
          // print(availabiltiyModel.availability);
          for (final mapEntry in availabiltiyModel.availability[1].entries) {
            final key = mapEntry.key;
            final value = mapEntry.value;
            print('Key: $key, Value: $value');
            arr.add(value);
            // Key: a, Value: 1 ...
          }
        }
      }
    });
  }
}
