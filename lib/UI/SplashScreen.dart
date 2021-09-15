import 'package:flutter/material.dart';
import 'package:mental_health/UI/HomeMain.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/UI/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _textFromFile ;
  @override
  void initState() {
    super.initState();
    getdetail();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(backgroundColorBlue),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.35,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/logo/Group.png',
                    width: SizeConfig.screenWidth * 0.4,
                    height: SizeConfig.screenHeight * 0.25,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Login');
                  },
                  child: Text(
                    "©2021 SAL Foundation.",
                    style: TextStyle(
                        color: Color(copyrightTextColor),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )));
  }
  Future<void> getdetail() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    _textFromFile= prefs.getString("therapistid");
    if(_textFromFile==null){
      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
         return LoginScreen();
        }));
      });

    }
    else{
      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return HomeMain();
        }));
      });
    }
  }
}
