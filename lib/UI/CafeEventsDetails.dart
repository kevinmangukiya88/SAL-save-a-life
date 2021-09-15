import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CafeEventsDetails extends StatefulWidget {
  var id;
  CafeEventsDetails({this.id});


  @override
  _CafeEventsDetailsState createState() => _CafeEventsDetailsState();
}

class _CafeEventsDetailsState extends State<CafeEventsDetails> {
  bool isError = false;
 bool isLoading = false;
  @override
  void initState() {
    getEventdetails();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Color(0XFFD8DFE9),
                      width: SizeConfig.screenWidth,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.025,
                          top: SizeConfig.blockSizeVertical * 3),
                      height: SizeConfig.screenHeight * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Color(midnightBlue),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.screenHeight * 0.18),
                            child: Text(
                              event['title'],
                              style: TextStyle(
                                  color: Color(fontColorSteelGrey),
                                  fontWeight: FontWeight.w600,
                                  fontSize: SizeConfig.blockSizeVertical * 3.5),
                            ),
                          ),
                          Container(
                            width: SizeConfig.screenWidth,
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth * 0.02,
                                vertical: SizeConfig.blockSizeVertical),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0XFFFAFAFA),
                                    shape: BoxShape.circle,
                                  ),
                                  height: SizeConfig.blockSizeVertical * 2.5,
                                  width: SizeConfig.screenWidth * 0.1,
                                ),
                                Container(
                                  child: Text(
                                    "Dr ${counsellor['first_name']} ${counsellor['last_name']}",
                                    style: TextStyle(
                                        color: Color(fontColorSteelGrey),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    DefaultTabController(
                        length: 2, // length of tabs
                        initialIndex: 0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: TabBar(
                                  labelColor: Color(backgroundColorBlue),
                                  unselectedLabelColor:
                                      Color(fontColorSteelGrey),
                                  tabs: [
                                    Tab(text: 'OVERVIEW'),
                                    Tab(text: 'ORGANIZER'),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 400, //height of TabBarView
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Colors.grey, width: 0.5))),
                                  child: TabBarView(children: <Widget>[
                                    Container(
                                      width: SizeConfig.screenWidth,
                                      margin: EdgeInsets.only(
                                        left: SizeConfig.screenWidth * 0.025,
                                        top: SizeConfig.blockSizeVertical * 3,
                                        right: SizeConfig.screenWidth * 0.025,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "About Event",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Color(backgroundColorBlue),
                                            ),
                                          ),
                                          Text(
                                            event['description'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Color(fontColorGray),
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                          Container(
                                            width: SizeConfig.screenWidth,
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    8,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                      SizeConfig.screenWidth *
                                                          0.1,
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      3.5,
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/bg/minusBg.png'),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  child: Image.asset(
                                                      'assets/icons/minus.png'),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    left: SizeConfig.screenWidth * 0.05
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Category",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        color: Color(backgroundColorBlue),
                                                      ),),
                                                      Text("Parenting, Stress",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(fontColorGray),
                                                        ),),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: SizeConfig.screenWidth,
                                            height:
                                            SizeConfig.blockSizeVertical *
                                                8,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                  SizeConfig.screenWidth *
                                                      0.1,
                                                  height: SizeConfig
                                                      .blockSizeVertical *
                                                      3.5,
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/bg/minusBg.png'),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  child: Image.asset(
                                                      'assets/icons/minus.png'),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: SizeConfig.screenWidth * 0.05
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Date",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          color: Color(backgroundColorBlue),
                                                        ),),
                                                      Text(event['date'],
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(fontColorGray),
                                                        ),),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.screenWidth,
                                      margin: EdgeInsets.only(
                                        left: SizeConfig.screenWidth * 0.025,
                                        top: SizeConfig.blockSizeVertical * 3,
                                        right: SizeConfig.screenWidth * 0.025,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "About Organizer",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Color(backgroundColorBlue),
                                            ),
                                          ),
                                          Text(
                                            counsellor['about'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Color(fontColorGray),
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                          Container(
                                            width: SizeConfig.screenWidth,
                                            height:
                                            SizeConfig.blockSizeVertical *
                                                8,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                  SizeConfig.screenWidth *
                                                      0.1,
                                                  height: SizeConfig
                                                      .blockSizeVertical *
                                                      3.5,
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/bg/minusBg.png'),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  child: Image.asset(
                                                      'assets/icons/minus.png'),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: SizeConfig.screenWidth * 0.05
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Language",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          color: Color(backgroundColorBlue),
                                                        ),),
                                                      Text("English,Hindi",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(fontColorGray),
                                                        ),),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]))
                            ])),
                  ]),
            ),
        bottomSheet: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.1,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(7),
              topLeft: Radius.circular(7),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 9.0,
                spreadRadius: 4,
                offset: Offset(1,1)
              ),
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text("₹ ${event['price']}",
                  style: TextStyle(
                    color: Color(backgroundColorBlue),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text("/ seat",
                    style: TextStyle(
                      color: Color(fontColorSteelGrey),
                      fontWeight: FontWeight.w400,
                    ),),
                ],
              ),
              MaterialButton(onPressed: (){},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text("BOOK TICKET",style: TextStyle(
                color: Colors.white,
              ),),
              color: Color(backgroundColorBlue),
              minWidth: SizeConfig.screenWidth * 0.5,)
            ],
          ),
        ),));
  }
  dynamic event=new List();
  dynamic counsellor=new List();
  void getEventdetails()async {
    setState(() {
      isLoading=true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var type;
    if(prefs.getString("type")=="Therapist"){
      type="therapist";
    }
    else{
      type="counsellor";
    }
    print(type);
    try {
      final response = await get(Uri.parse('https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/${type}/event?order_id=${widget.id}'));
      print("bjkb" + response.body.toString());
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);

        event=responseJson['event'];
        counsellor=responseJson['counsellor'];
        setState(() {
          isError = false;
          isLoading = false;
          print('setstate');
        });


      } else {
        print("bjkb" + response.statusCode.toString());
        // showToast("Mismatch Credentials");
        showAlertDialog(
          context,
          response.statusCode.toString(),
          "",
        );
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        isError = true;
        isLoading = false;
      });
      showAlertDialog(
        context,
        e.toString(),
        "",
      );
    }
  }

}
