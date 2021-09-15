import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Price1.dart';

int experienceYears = 1;
bool selected = false;
bool counselling = false;
bool psychiatrist = false;
bool clinicalPsychologist = false;
bool psychotherapist = false;
bool others = false;
var qualification;
class ProfessionalInfo2 extends StatefulWidget {
  const ProfessionalInfo2({Key key}) : super(key: key);

  @override
  _ProfessionalInfo2State createState() => _ProfessionalInfo2State();
}

class _ProfessionalInfo2State extends State<ProfessionalInfo2> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:radioValue.toString()=="Listener"?Text("5/7",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),):Text("5/8",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),),
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),onTap: (){
          Navigator.pop(context);
        },),
        // actions: [
        //   Container(
        //     alignment: Alignment.center,
        //     padding: EdgeInsets.all(SizeConfig.blockSizeVertical),
        //     child: Text(
        //       "Skip",
        //       style: GoogleFonts.openSans(color: Colors.blue),
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              value: 0.5,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.15,
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Text(
                "What's your relevant qualification?",
                style: GoogleFonts.openSans(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    fontWeight: FontWeight.bold,
                    color: Color(fontColorSteelGrey)),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 6,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = true;
                        counselling = true;
                        psychiatrist = false;
                        clinicalPsychologist = false;
                        psychotherapist = false;
                        others = false;
                      });
                    },
                    child: Container(
                      child: Text(
                        "Counselling Psychologist",
                        style: GoogleFonts.openSans(
                            color: counselling == true && selected == true
                                ? Colors.white
                                : Color(fontColorGray),
                            fontSize: SizeConfig.blockSizeVertical * 2),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: counselling == true && selected == true
                              ? Colors.blue
                              : Colors.white,
                          border: Border.all(
                              color: counselling == true && selected == true
                                  ? Colors.blue
                                  : Color(fontColorGray),
                              width: 1.0)),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = true;
                        psychiatrist = true;
                        counselling = false;
                        clinicalPsychologist = false;
                        psychotherapist = false;
                        others = false;
                      });
                    },
                    child: Container(
                      child: Text(
                        "Psychiatrist",
                        style: GoogleFonts.openSans(
                            color: psychiatrist == true && selected == true
                                ? Colors.white
                                : Color(fontColorGray),
                            fontSize: SizeConfig.blockSizeVertical * 2),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: psychiatrist == true && selected == true
                              ? Colors.blue
                              : Colors.white,
                          border: Border.all(
                              color: psychiatrist == true && selected == true
                                  ? Colors.blue
                                  : Color(fontColorGray),
                              width: 1.0)),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 6,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = true;
                        clinicalPsychologist = true;
                        psychiatrist = false;
                        counselling = false;
                        psychotherapist = false;
                        others = false;
                      });
                    },
                    child: Container(
                      child: Text(
                        "Clinical Psychologist",
                        style: GoogleFonts.openSans(
                            color:
                                clinicalPsychologist == true && selected == true
                                    ? Colors.white
                                    : Color(fontColorGray),
                            fontSize: SizeConfig.blockSizeVertical * 2),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:
                              clinicalPsychologist == true && selected == true
                                  ? Colors.blue
                                  : Colors.white,
                          border: Border.all(
                              color: clinicalPsychologist == true &&
                                      selected == true
                                  ? Colors.blue
                                  : Color(fontColorGray),
                              width: 1.0)),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = true;
                        psychotherapist = true;
                        others = false;
                        clinicalPsychologist = false;
                        psychiatrist = false;
                        counselling = false;
                      });
                    },
                    child: Container(
                      child: Text(
                        "Psychotherapist",
                        style: GoogleFonts.openSans(
                            color: psychotherapist == true && selected == true
                                ? Colors.white
                                : Color(fontColorGray),
                            fontSize: SizeConfig.blockSizeVertical * 2),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: psychotherapist == true && selected == true
                              ? Colors.blue
                              : Colors.white,
                          border: Border.all(
                              color: psychotherapist == true && selected == true
                                  ? Colors.blue
                                  : Color(fontColorGray),
                              width: 1.0)),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 6,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = true;
                        others = true;
                        psychotherapist = false;
                        clinicalPsychologist = false;
                        psychiatrist = false;
                        counselling = false;
                      });
                    },
                    child: Container(
                      child: Text(
                        "Others",
                        style: GoogleFonts.openSans(
                            color: others == true && selected == true
                                ? Colors.white
                                : Color(fontColorGray),
                            fontSize: SizeConfig.blockSizeVertical * 2),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: others == true && selected == true
                              ? Colors.blue
                              : Colors.white,
                          border: Border.all(
                              color: others == true && selected == true
                                  ? Colors.blue
                                  : Color(fontColorGray),
                              width: 1.0)),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 8,
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                //right: SizeConfig.screenWidth * 0.05,
              ),
              child: Text(
                "How much experience do you have?",
                style: GoogleFonts.openSans(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    fontWeight: FontWeight.bold,
                    color: Color(fontColorSteelGrey)),
              ),
            ),
            Slider(
              activeColor: Colors.blue,
              divisions: 10,
              inactiveColor: Colors.grey[300],
              label: experienceYears.toString(),
              max: 10,
              min: 0,
              value: experienceYears.toDouble(),
              onChanged: (double newYear) {
                setState(() {
                  experienceYears = newYear.round();
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        backgroundColor: selected == true && experienceYears >= 1
            ? Colors.blue
            : Colors.grey,
        onPressed: () {
          if (counselling == true ||
              psychiatrist == true ||
              clinicalPsychologist == true ||
              psychotherapist == true ||
              others == true)
           {
             if(counselling==true){
               qualification="Counselling";
               Navigator.of(context).pushNamed('/Info1');
             }

             else if( psychiatrist == true){
               qualification="Psychiatrist";
               Navigator.of(context).pushNamed('/Info1');
             }
             else if(  clinicalPsychologist == true){
               qualification="ClinicalPsychologist";
               Navigator.of(context).pushNamed('/Info1');
             }
             else if( psychotherapist == true){
               qualification="psychotherapist";

               Navigator.of(context).pushNamed('/Info1');
             }
             else if( others == true){
               qualification="others";
               Navigator.of(context).pushNamed('/Info1');
             }

           }
          else
            toast("Please select qualification");
        },
      ),
    ));
  }
}
