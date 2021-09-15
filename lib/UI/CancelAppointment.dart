import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:nb_utils/nb_utils.dart';

class CancelAppointment extends StatefulWidget {
  const CancelAppointment({Key key}) : super(key: key);

  @override
  _CancelAppointmentState createState() => _CancelAppointmentState();
}

class _CancelAppointmentState extends State<CancelAppointment> {

  int radioGroup = -1;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text("Cancel Appointment",style: GoogleFonts.openSans(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),),
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 2,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05
              ),
              child: Text("Please tell us the reason for cancelling the appointment",
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                color: Color(fontColorSteelGrey),
                fontSize: SizeConfig.blockSizeVertical * 2.5
              ),),
            ),
            RadioListTile(
                value: 1,
                groupValue: radioGroup,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text("I have an emergency",
                style: GoogleFonts.openSans(
                  color: Color(fontColorSteelGrey),
                ),),
                onChanged: (value){
                  setState(() {
                    radioGroup = value;
                  });
                }),
            RadioListTile(
                value: 2,
                groupValue: radioGroup,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text("I am not available at the set time",
                style: GoogleFonts.openSans(
                  color: Color(fontColorSteelGrey),
                ),),
                onChanged: (value){
                  setState(() {
                    radioGroup = value;
                  });
                }),
            RadioListTile(
                value: 3,
                groupValue: radioGroup,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text("I don't want to contact the person",
                style: GoogleFonts.openSans(
                  color: Color(fontColorSteelGrey),
                ),),
                onChanged: (value){
                  setState(() {
                    radioGroup = value;
                  });
                }),
            RadioListTile(
                value: 4-1214,
                groupValue: radioGroup,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text("Other",
                style: GoogleFonts.openSans(
                  color: Color(fontColorSteelGrey),
                ),),
                onChanged: (value){
                  setState(() {
                    radioGroup = value;
                  });
                }),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
                top: SizeConfig.blockSizeVertical * 2
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed('/CancelAppointment');
                    },
                    color: Colors.white,
                    minWidth: SizeConfig.screenWidth * 0.4,
                    child: Text("DON'T",style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                    ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: Color(fontColorGray)
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){
                      toast("Appointment Cancel successfully");
                      Navigator.of(context).pushNamed('/');
                    },
                    color: Colors.blue,
                    minWidth: SizeConfig.screenWidth * 0.4,
                    child: Text("CANCEL",style: GoogleFonts.openSans(
                      color: Colors.white,
                    ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: Colors.blue
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
