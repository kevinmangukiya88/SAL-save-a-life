import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mental_health/UI/LoginScreen.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';



showAlertDialog(BuildContext context, String message, String type,
    {double rate,
      bool isfeedback,
      String submitfeedback,
      String logoutUser,
      Function onTap,
      String userToken,
      userId,
      groupId}) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
              alignment: Alignment.center,
              child: Text(
                  message,
                  maxLines: 2,
               style: TextStyle(
                   fontSize: SizeConfig.blockSizeVertical * 2.2,
                   color: Colors.black),),
            ),
            type != "Logout"
                ? Container(
              margin:
              EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  if (type == "Forget Password") {
                    FocusScope.of(context).unfocus();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                  } if (type == "GroupUpdate") {
                    FocusScope.of(context).unfocus();



                  }else{
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  decoration:
                  boxDecoration(bgColor: Color(backgroundColorBlue), radius: 30),
                  padding: EdgeInsets.fromLTRB(38, 8, 38, 10),
                  child: Text("Ok",style: TextStyle( color: Colors.white,
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
 ),
                     ),
                ),
              ),
            )
                : Container(
              alignment: Alignment.bottomCenter,
              margin:
              EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        if (type == "Logout") {
                          onTap();
                        } else {
                          if (type == "Forget Password") {

                          } else if (type == "Update Profile") {

                          } else if (type == "GroupUpdate")
                          {

                          } else if (type == "Change Password") {

                          }
                        }
                      },
                      child: Container(
                        decoration: boxDecoration(
                            bgColor: Color(backgroundColorBlue), radius: 30),
                        padding: EdgeInsets.fromLTRB(28, 4, 28, 6),
                        child: Text("Yes",style: TextStyle(color: Color(whiteColor),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                           ),
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeVertical * 2.5,
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: boxDecoration(
                            bgColor:  Color(backgroundColorBlue), radius: 30),
                        padding: EdgeInsets.fromLTRB(28, 4, 28, 6),
                        child: Text("No",
                           style: TextStyle(color: Color(whiteColor),
                             fontSize: 16.0,
                             fontWeight: FontWeight.w500,
                           ),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(onWillPop: () async => false, child: alert);
    },
  );
}




KeyboardActionsConfig buildConfig(BuildContext context, FocusNode node) {
  return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey.shade300,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          displayArrows: false,
          focusNode: node,
        )
      ]);
}


BoxDecoration boxDecoration(
    {double radius = 2,
      Color color = Colors.transparent,
      Color bgColor,
      var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ,
    boxShadow: [BoxShadow(
      blurRadius: 2.0, // soften the shadow
      spreadRadius: 1,
      color: Colors.grey,//extend the shadow
      offset: Offset(
        0.0, // Move to right 10  horizontally
        1.0, // Move to bottom 5 Vertically
      ),
    ),],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}


