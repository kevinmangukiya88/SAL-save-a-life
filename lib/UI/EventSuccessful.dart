import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

import 'Home2.dart';
import 'HomeMain.dart';
import 'KYCScreen.dart';

class EventSuccessful extends StatefulWidget {
  const EventSuccessful({Key key}) : super(key: key);

  @override
  _EventSuccessfulState createState() => _EventSuccessfulState();
}

class _EventSuccessfulState extends State<EventSuccessful> {
  @override
  void initState() {

    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return isKyc ? HomeMain() : Home2();
      }));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.3
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/circle bg.png'),
                        fit: BoxFit.cover
                    ),
                    shape: BoxShape.circle
                ),
                width: SizeConfig.screenWidth * 0.5,
                height: SizeConfig.screenHeight * 0.3,
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 3),
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icons/blue circle bg.png'),
                            fit: BoxFit.cover
                        ),
                        shape: BoxShape.circle
                    ),
                    child: Image.asset('assets/icons/done.png',
                      scale: SizeConfig.blockSizeVertical * 0.5,)
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              width: SizeConfig.screenWidth,
              child: Text("Event Successfully Created",style: GoogleFonts.openSans(
                  fontSize: SizeConfig.blockSizeVertical * 3.25,
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey)
              ),),
            ),
          ],
        ),
      ),
    ));
  }
}
