import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/NotificationScreen.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/DrawerMenu.dart';
import 'package:mental_health/Utils/NavigationBar.dart';
import 'package:mental_health/Utils/SharedPref.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/Utils/TimeAgoWidget.dart';
import 'package:mental_health/constant/AppColor.dart';
import 'package:mental_health/data/repo/getHomeContentRepo.dart';
import 'package:mental_health/models/GetHomeContentModal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mental_health/models/getTherapistDetailModal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeMain.dart';

String therapistId;

class Home2 extends StatefulWidget {
  const Home2({Key key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var first;
  var last;
  var getHomeContent = GetHomePageContentRepo();
  var getHomeContentModal = GetHomeContentModal();
  bool isloding = false;

  List<Color> colors = [
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(48, 37, 33, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(48, 37, 33, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
  ];


  getUserData() async {
    SharedPreferencesTest().saveuserdata("get").then((value) async {
      if (value != null && value != "") {
        setState(() {
          Map userupdateddata = json.decode(value);
          getTherapistData = Therapist.fromJson(userupdateddata);
        });
      }
    });
  }

  getTherapistId() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    last=   prefs.getString("lastname");
    first =
        prefs.getString("firstname");
    print(prefs.getString("lastname"));
    SharedPreferencesTest().getTherapistId().then((value) async {
      if (value != null && value != "") {
        setState(() {
          therapistId = value;
          print("dfvff"+therapistId.toString());
        });
        getHomeContent
            .getHomeContent(
          context: context,
        )
            .then((value) {
              print(value.meta.status);
          if (value != null) {
            if (value.meta.status == "200") {
              setState(()  {
                isloding = false;
                getHomeContentModal = value;


              });
            } else {
              setState(() {
                isloding = false;
              });
              showAlertDialog(
                context,
                value.meta.message,
                "",
              );
            }
          } else {
            setState(() {
              isloding = false;
            });
            showAlertDialog(
              context,
              value.meta.message,
              "",
            );
          }
        }).catchError((error) {
          setState(() {
            isloding = false;
          });
          showAlertDialog(
            context,
            error.toString(),
            "",
          );
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
    getTherapistId();
    isloding = true;

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> widgetList = new List<Widget>();
    var child = SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/bg/Frame.png'),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        actions: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return NotificationsScreen();
                              }));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal * 5),
                              child: Icon(
                                Icons.notifications_none_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                            vertical: SizeConfig.blockSizeVertical),
                        child: Text("Hello,",
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeVertical * 3)),
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                            vertical: SizeConfig.blockSizeVertical),
                        child: Text(first != null && last != null ? " ${first + " " + last }": "",
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.blockSizeVertical * 3.5)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/KYC');
                        },
                        child: Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.blockSizeVertical * 5,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                            vertical: SizeConfig.blockSizeVertical,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Complete your KYC to Start taking bookings",
                            style: GoogleFonts.openSans(
                                color: Color(backgroundColorBlue),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.3),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(65)),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3.5,
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                            vertical: SizeConfig.blockSizeVertical),
                        child: Text(
                          "LEARN",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              color: Color(fontColorGray)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.02,
                            vertical: SizeConfig.blockSizeVertical * 2),
                        child: getHomeContentModal != null &&
                                getHomeContentModal.articles != null &&
                                getHomeContentModal.articles.length > 0
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                primary: false,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8),
                                itemBuilder: (BuildContext context, int index) {
                                  /* if(colors.length < getHomeContentModal.articles.length){
                                    colors.addAll(colors);
                                  }*/
                                  return Container(
                                    width: SizeConfig.screenWidth * 0.4,
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: getHomeContentModal != null &&
                                                getHomeContentModal
                                                        .articles.length >
                                                    0 &&
                                                getHomeContentModal.articles
                                                        .elementAt(index)
                                                        .photo !=
                                                    null &&
                                                getHomeContentModal.articles
                                                        .elementAt(index)
                                                        .photo !=
                                                    ""
                                            ? CachedNetworkImageProvider(
                                                "https://sal-prod.s3.ap-south-1.amazonaws.com/" +
                                                    getHomeContentModal.articles
                                                        .elementAt(index)
                                                        .photo)
                                            : AssetImage(
                                                "assets/bg/gridCard1.png",
                                              ),
                                      ),
                                    ),
                                    child: Container(
                                      width: SizeConfig.screenWidth,
                                      padding: EdgeInsets.only(
                                          left: SizeConfig.screenWidth * 0.02,
                                          right: SizeConfig.screenWidth * 0.02),
                                      height: SizeConfig.blockSizeVertical * 8,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: colors[index],
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            getHomeContentModal != null &&
                                                    getHomeContentModal
                                                            .articles.length >
                                                        0
                                                ? getHomeContentModal.articles
                                                    .elementAt(index)
                                                    .title
                                                : "",
                                            style: GoogleFonts.openSans(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,fontSize: SizeConfig.blockSizeVertical  * 1.25),
                                          ),
                                          Text(
                                            timeAgo(DateTime.parse(
                                                getHomeContentModal.articles
                                                    .elementAt(index)
                                                    .createdAt)),
                                            style: GoogleFonts.openSans(
                                                color: Colors.white,
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: getHomeContentModal.articles !=
                                            null &&
                                        getHomeContentModal.articles.length > 0
                                    ? getHomeContentModal.articles.length
                                    : 0,
                              )
                            : Container(
                                child: Center(child: Text("No content found")),
                              ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: DrawerMenu(),
      bottomNavigationBar: NavigationBar(
        index: 0,
      ),
    ));
    widgetList.add(child);
    if (isloding) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          new Center(
            child: new CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(colorPrimary),
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(children: widgetList);
  }
}
