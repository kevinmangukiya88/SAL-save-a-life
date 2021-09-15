import 'package:flutter/material.dart';
import 'package:mental_health/UI/LoginScreen.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SharedPref.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}


class _SettingsState extends State<Settings> {

  bool type1 = false;
  bool type2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_rounded,color: Color(midnightBlue),),
        ),
        centerTitle: true,
        title: Text("Settings",
          style: TextStyle(
              color: Color(midnightBlue),
              fontWeight: FontWeight.w600
          ),),
      ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Container(
                width: SizeConfig.screenWidth,
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.02,
                    vertical: SizeConfig.blockSizeVertical
                ),
                child: Text("Notifications",
                  style: TextStyle(
                      color: Color(backgroundColorBlue),
                      fontWeight: FontWeight.w600
                  ),),
              ),
              Container(
                width: SizeConfig.screenWidth,
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.02
                ),
                alignment: Alignment.center,
                child: SwitchListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text("Type"),
                  value: type1,
                  onChanged: (value){
                    setState(() {
                      type1 = value;
                    });
                  },
                  activeTrackColor: Color(0XFFDBE6F5),
                  activeColor: Color(backgroundColorBlue),
                  inactiveTrackColor: Color(0XFFD8DFE9),
                  inactiveThumbColor: Color(fontColorGray),
                )
              ),
              Container(
                  width: SizeConfig.screenWidth,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.02
                  ),
                  alignment: Alignment.center,
                  child: SwitchListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text("Type"),
                    value: type2,
                    onChanged: (value){
                      setState(() {
                        type2 = value;
                      });
                    },
                    activeTrackColor: Color(0XFFDBE6F5),
                    activeColor: Color(backgroundColorBlue),
                    inactiveTrackColor: Color(0XFFD8DFE9),
                    inactiveThumbColor: Color(fontColorGray),
                  )
              ),
              GestureDetector(
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                  SharedPreferencesTest()
                      .checkIsLogin(
                      "2");

                },
                child: Container(
                  width: SizeConfig.screenWidth,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.02,
                    right: SizeConfig.screenWidth * 0.02,
                    top: SizeConfig.screenHeight * 0.6,
                    bottom: SizeConfig.blockSizeVertical * 2,
                  ),
                  child: Text("Logout",
                    style: TextStyle(
                        color: Color(backgroundColorBlue),
                        fontWeight: FontWeight.w600
                    ),),
                ),
              ),
              Container(
                width: SizeConfig.screenWidth,
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.02
                ),
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.02
                ),
                alignment: Alignment.center,
                child: Text("Sal Version 1.0",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(fontColorSteelGrey),
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
              ),
            ],
          ),
        ),
      backgroundColor: Colors.white,
    ));
  }
}
