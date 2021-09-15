import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_health/UI/Info%203.dart';
import 'package:mental_health/UI/Info1.dart';
import 'package:mental_health/UI/LoginScreen.dart';
import 'package:mental_health/UI/Price1.dart';
import 'package:mental_health/UI/Price2.dart';
import 'package:mental_health/UI/Price3.dart';
import 'package:mental_health/UI/ProfessionalInfo2.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/Dialogs.dart';
import 'package:mental_health/Utils/SharedPref.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/data/repo/LoginUser.dart';
import 'package:mental_health/data/repo/listenerregister.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Info2.dart';
import 'Occupation.dart';

class Price4listener extends StatefulWidget {
  const Price4listener({Key key}) : super(key: key);

  @override
  _Price4listenerState createState() => _Price4listenerState();
}

class _Price4listenerState extends State<Price4listener> {
  final GlobalKey<State> loginLoader = new GlobalKey<State>();
  var createUser = CreateListenerProfileRepo();
  @override
  void initState() {
    print(profileImage);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Summary",
          style: GoogleFonts.openSans(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(
          left: SizeConfig.screenWidth * 0.05,
          right: SizeConfig.screenWidth * 0.05,
          top: SizeConfig.blockSizeVertical * 3,
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.5,
                blurRadius: 0.9,
                offset: Offset.fromDirection(2, 1),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Price1()));
              },
              color: Colors.white,
              minWidth: SizeConfig.screenWidth * 0.4,
              child: Text(
                "EDIT",
                style: GoogleFonts.openSans(
                  color: Color(fontColorGray),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Color(fontColorGray)),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Dialogs.showLoadingDialog(context, loginLoader);
                /* Future.delayed(Duration(seconds: 2)).then((value) {
                  SharedPreferencesTest().checkIsLogin("0");
                  Navigator.of(context).pushNamed('/Price5');
                });*/
                print(mobileController.text);
                createUser
                    .createCounsellor(
                  aadhar: adhaarDoc,
                  about: aboutController.text,
                  certificate: certificateDoc,
                  context: context,
                  device_id: "",
                  education: "",
                  email: "",
                  experience: "",
                  first_name: firstNameController.text,
                  gender: genderVal.toString(),
                  language_ids: selectedVal
                      .toString()
                      .replaceAll(
                        "[",
                        "",
                      )
                      .replaceAll("]", ""),
                  last_name: lastNameController.text,
                  linkedin: linkController.text,
                  phone: "91" + mobileController.text,
                  photo: profileImage.toString(),
                  price: "",
                  price_3: "",
                  price_5: "",
                  resume: "",
                  topic_ids: "",
                )
                    .then((value) async {
                  if (value != null) {
                    print(value.meta.status);
                    print(createUser.createCounsellor());
                    if (value.meta.status == "200") {
                      Navigator.of(loginLoader.currentContext,
                              rootNavigator: true)
                          .pop();
                      print(value.meta.message);
                      print(value.meta.status);
                      print(value.meta.messageType);
                      //toast(value.meta.message);
                      SharedPreferencesTest().checkIsLogin("0");
                      SharedPreferencesTest().saveListenerid(value.listener_id);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("type", "Listener");
                      prefs.setString("therapistid", value.listener_id);
                      prefs.setString("firstname", firstNameController.text);
                      prefs.setString("lastname", lastNameController.text);
                      print("listener_id" + value.listener_id);
                      ;
                      Navigator.of(context).pushNamed('/Price5');
                    } else {
                      Navigator.of(loginLoader.currentContext,
                              rootNavigator: true)
                          .pop();
                      showAlertDialog(
                        context,
                        value.meta.message,
                        "",
                      );
                    }
                  } else {
                    Navigator.of(loginLoader.currentContext,
                            rootNavigator: true)
                        .pop();
                    showAlertDialog(
                      context,
                      value.meta.message,
                      "",
                    );
                  }
                }).catchError((error) {
                  Navigator.of(loginLoader.currentContext, rootNavigator: true)
                      .pop();
                  showAlertDialog(
                    context,
                    error.toString(),
                    "",
                  );
                });
              },
              color: Colors.blue,
              minWidth: SizeConfig.screenWidth * 0.4,
              child: Text(
                "SUBMIT",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: SizeConfig.blockSizeVertical * 7.5,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: SizeConfig.blockSizeVertical * 7.45,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: image != null
                              ? FileImage(File(image.path))
                              : AssetImage("assets/icons/user.png"),
                          fit: BoxFit.fill),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 2,
                right: SizeConfig.screenWidth * 0.05,
                left: SizeConfig.screenWidth * 0.05,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    firstNameController.text + lastNameController.text,
                    style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeVertical * 2.5),
                  ),
                  Text(
                    radioValue.toString(),
                    style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 2),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.05,
                  right: SizeConfig.screenWidth * 0.05,
                  top: SizeConfig.blockSizeVertical * 4,
                  bottom: SizeConfig.blockSizeVertical * 4),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    genderVal,
                    style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 1.5),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                 Text(
                    "Languages",
                    style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    selectedVal
                        .toString()
                        .replaceAll("[", "")
                        .replaceAll("]", ""),
                    style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 1.5),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text(
                    "Can Be A Listener For",
                    style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Anxiety Management, Life Coaching",
                    style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 1.5),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text(
                    "Qualification",
                    style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Clinical Psychologist",
                    style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 1.5),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text(
                    "Ocupation",
                    style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    Occupationval.toString(),
                    style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 1.5),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text(
                    "Qualification Certificate",
                    style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    adhaarCardImage != null && adhaarCardImage != ""
                        ? adhaarCardImage.path
                        : "",
                    style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 1.5),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<File> chooseCameraFile() async {
    await ImagePicker.pickImage(
      source: ImageSource.camera,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        image = new File(value.path);
      });
      if (image.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return image;
  }

  Future<File> androidchooseImageFile() async {
    await ImagePicker.pickImage(
      source: ImageSource.gallery,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        image = new File(value.path);
      });
      if (image.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return image;
  }
}
