import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/UI/HomeMain.dart';
import 'package:mental_health/UI/KYCScreen.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SharedPref.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/data/repo/getTherapistDetailRepo.dart';
import 'package:mental_health/models/getTherapistDetailModal.dart' as therapist;


class Price5 extends StatefulWidget {
  const Price5({Key key}) : super(key: key);

  @override
  _Price5State createState() => _Price5State();
}

class _Price5State extends State<Price5> {
  var getDetails  = GetTherapistDetailRepo();
  var contentModal = therapist. GetTherapistDetailModal();
  therapist.Therapist therapistDetails;
  bool isLoading = false;

  getTherapistId() async {
    SharedPreferencesTest().getTherapistId().then((value) async {
      if (value != null && value != "") {
        setState(() {
          therapistId = value;
        });
        getDetails
            .getTherapistDetail(
            context: context,therapistId: therapistId
        ).then((value) {
          if (value != null) {
            if (value.meta.status == "200") {
              setState(() {
                isLoading = false;
                contentModal = value;
                SharedPreferencesTest().saveuserdata("set",
                    userdata : value.therapist);
              });
            } else {
              setState(() {
                isLoading = false;
              });
              showAlertDialog(
                context,
                value.meta.message,
                "",
              );
            }
          } else {
            setState(() {
              isLoading = false;

            });
            showAlertDialog(
              context,
              value.meta.message,
              "",
            );
          }
        }).catchError((error) {
          setState(() {
            isLoading = false;
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
    isLoading = true;
    getTherapistId();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return isKyc ? HomeMain() : Home2();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
              alignment: Alignment.center,
              child: Text("Successfully Completed",style: GoogleFonts.openSans(
                  fontSize: SizeConfig.blockSizeVertical * 3.5,
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey)
              ),),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.15,
                right: SizeConfig.screenWidth * 0.15,
                top: SizeConfig.blockSizeVertical * 2
              ),
              alignment: Alignment.center,
              child: Text("We'll let you know when your profile is approved",style: GoogleFonts.openSans(
                  fontSize: SizeConfig.blockSizeVertical * 2,
                  fontWeight: FontWeight.normal,
                  color: Color(fontColorGray)
              ),),
            ),
          ],
        ),
      ),
    ));
  }
}
