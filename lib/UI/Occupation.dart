import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/Price1.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:nb_utils/nb_utils.dart';
String Occupationval = "";
class Occupation extends StatefulWidget{
  @override
  _OccupationvalState createState() => _OccupationvalState();
}

class _OccupationvalState extends State<Occupation> {
  GlobalKey<FormState> nameForm = GlobalKey<FormState>();

  TextEditingController whyController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  FocusNode firstNameFocusNode;
  FocusNode lastNameFocusNode;
  
  bool selected = false;
  @override void initState() {
    // TODO: implement initState
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    super.initState();
  }
  bool filledFn = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: radioValue.toString()=="Listener"?Text("3/7",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),):Text("3/8",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),),
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),onTap: (){
          Navigator.pop(context);
        },),
      ),
      body: SafeArea(child:  Column(children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.15,
        ),

        Container(
          margin: EdgeInsets.only(
            left: SizeConfig.screenWidth * 0.05,
            right: SizeConfig.screenWidth * 0.05,
          ),
          child: Text("Whats Your Occupation",style: GoogleFonts.openSans(
              fontSize: SizeConfig.blockSizeVertical * 4,
              fontWeight: FontWeight.bold,
              color: Color(fontColorSteelGrey)
          ),),
        ),
        Column(children: [

          Container(
            child: RadioListTile<String>(
              value: "Home Maker", groupValue: Occupationval.toString(), onChanged: (String value){
              setState(() {
                Occupationval = value;
                selected = true;
              });
            },
              title: Text("Home Maker",style: TextStyle(
                  color: Color(fontColorGray)
              ),),),
          ),
          Container(
            child: RadioListTile<String>(
              value: "Student", groupValue: Occupationval.toString(), onChanged: (String value){
              setState(() {
                Occupationval = value;
                selected = true;
              });
            },
              title: Text("Student",style: TextStyle(
                  color: Color(fontColorGray)
              ),),),
          ),
          Container(
            child: RadioListTile<String>(
              value: "Working", groupValue: Occupationval.toString(), onChanged: (String value){
              setState(() {
                Occupationval = value;
                selected = true;
              });
            },
              title: Text("Working",style: TextStyle(
                  color: Color(fontColorGray)
              ),),),
          ),
          Container(
            child: RadioListTile<String>(
              value: "Retired", groupValue: Occupationval.toString(), onChanged: (String value){
              setState(() {
                Occupationval = value;
                selected = true;
              });
            },
              title: Text("Retired",style: TextStyle(
                  color: Color(fontColorGray)
              ),),),
          ),
          Container(
            child: RadioListTile<String>(
              value: "Other", groupValue: Occupationval.toString(), onChanged: (String value){
              setState(() {
                Occupationval = value;
                selected = true;
              });
            },
              title: Text("Other",style: TextStyle(
                  color: Color(fontColorGray)
              ),),),
          ),
        ],)
      ],),),floatingActionButton: FloatingActionButton(
      child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
      backgroundColor: selected == true? Colors.blue : Colors.grey,
      onPressed: (){
        if(Occupationval != null && Occupationval != "" && filledFn != "")
          Navigator.of(context).pushNamed('/ProfessionalInfo1');
        else
          toast("Please select details first");
      },
    ),
    );
  }
}