import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Listener2.dart';
import 'Price1.dart';

TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
FocusNode firstNameFocusNode;
FocusNode lastNameFocusNode;


bool selected = false;
bool filledFn = false;
bool filledLn = false;
String genderVal = "";
String ageVal = "";


class Price2 extends StatefulWidget {

  const Price2({Key key}) : super(key: key);

  @override
  _Price2State createState() => _Price2State();
}

class _Price2State extends State<Price2> {

  GlobalKey<FormState> nameForm = GlobalKey<FormState>();


  @override void initState() {
    // TODO: implement initState
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();

  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:radioValue.toString()=="Listener"?Text("2/7",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),):Text("2/8",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),),
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),onTap: (){
          Navigator.pop(context);
        },),
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
              value: 0.1,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.15,
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Text("What's Your Name?",style: GoogleFonts.openSans(
                  fontSize: SizeConfig.blockSizeVertical * 4,
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey)
              ),),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
                top: SizeConfig.blockSizeVertical * 4
              ),
              child: Form(
                key: nameForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      focusNode: firstNameFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(fontColorGray)
                          )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        hintText: "First Name",
                        isDense: true,
                        contentPadding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
                      ),
                      onFieldSubmitted: (term){
                        firstNameFocusNode.unfocus();
                        FocusScope.of(context).requestFocus(lastNameFocusNode);
                        filledFn = true;
                      },
                      onChanged: (v){
                        setState(() {
                          filledFn = true;
                        });
                      },
                      validator: (c){
                        if(c.isEmpty)
                          return "Please fill required fields";
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 2,
                    ),
                    TextFormField(
                      onChanged: (v){
                       setState(() {
                         filledLn = true;
                       });
                      },
                      controller: lastNameController,
                      focusNode: lastNameFocusNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        hintText: "Last Name",
                        isDense: true,
                        contentPadding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
                      ),
                      onFieldSubmitted: (term){
                        lastNameFocusNode.unfocus();
                        filledLn = true;
                      },
                      validator: (c){
                        if(c.isEmpty)
                          return "Please fill required fields";
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
                top: SizeConfig.blockSizeVertical * 1.5
              ),
              child: Text("How do you identify?",style: GoogleFonts.openSans(
                  fontSize: SizeConfig.blockSizeVertical * 4,
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey)
              ),),
            ),
            Container(
              child: RadioListTile<String>(
                value: "Male", groupValue: genderVal.toString(), onChanged: (String value){
                setState(() {
                  genderVal = value;
                  selected = true;
                });
              },
                title: Text("Male",style: TextStyle(
                    color: Color(fontColorGray)
                ),),),
            ),
            Container(
              child: RadioListTile<String>(
                value: "Female", groupValue: genderVal.toString(), onChanged: (String value){
                setState(() {
                  genderVal = value;
                  selected = true;
                });
              },
                title: Text("Female",style: TextStyle(
                    color: Color(fontColorGray)
                ),),),
            ),
            Container(
              child: RadioListTile<String>(
                value: "Other", groupValue: genderVal.toString(), onChanged: (String value){
                setState(() {
                  genderVal = value;
                  selected = true;
                });
              },
                title: Text("Other",style: TextStyle(
                    color: Color(fontColorGray)
                ),),),
            ),
         radioValue.toString()=="Listener"?
         Column(children: [
             Container(
               margin: EdgeInsets.only(
                   left: SizeConfig.screenWidth * 0.05,
                   right: SizeConfig.screenWidth * 0.05,
                   top: SizeConfig.blockSizeVertical * 1.5
               ),
               child: Text("What's Your Age Group",style: GoogleFonts.openSans(
                   fontSize: SizeConfig.blockSizeVertical * 4,
                   fontWeight: FontWeight.bold,
                   color: Color(fontColorSteelGrey)
               ),),
             ),
             Container(
               child: RadioListTile<String>(
                 value: "18-25", groupValue: ageVal.toString(), onChanged: (String value){
                 setState(() {
                   ageVal = value;
                   selected = true;
                 });
               },
                 title: Text("18-25 Years",style: TextStyle(
                     color: Color(fontColorGray)
                 ),),),
             ),
             Container(
               child: RadioListTile<String>(
                 value: "26-35", groupValue: ageVal.toString(), onChanged: (String value){
                 setState(() {
                   ageVal = value;
                   selected = true;
                 });
               },
                 title: Text("26-35 Years",style: TextStyle(
                     color: Color(fontColorGray)
                 ),),),
             ),
             Container(
               child: RadioListTile<String>(
                 value: "36-45", groupValue: ageVal.toString(), onChanged: (String value){
                 setState(() {
                   ageVal = value;
                   selected = true;
                 });
               },
                 title: Text("36-45 Years",style: TextStyle(
                     color: Color(fontColorGray)
                 ),),),
             ),
             Container(
               child: RadioListTile<String>(
                 value: "46-50", groupValue: ageVal.toString(), onChanged: (String value){
                 setState(() {
                   ageVal = value;
                   selected = true;
                 });
               },
                 title: Text("45-50 Years",style: TextStyle(
                     color: Color(fontColorGray)
                 ),),),
             ),
             Container(
               child: RadioListTile<String>(
                 value: "50+", groupValue: ageVal.toString(), onChanged: (String value){
                 setState(() {
                   ageVal = value;
                   selected = true;
                 });
               },
                 title: Text("50+ Years",style: TextStyle(
                     color: Color(fontColorGray)
                 ),),),
             ),
           ],):Container()

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
        backgroundColor: selected == true &&  filledFn == true&&filledLn==true? Colors.blue : Colors.grey,
        onPressed: (){
          if(genderVal != null && genderVal != "" && filledFn != ""&&firstNameController.text!=null&&lastNameController.text!=null)
            if(radioValue.toString()=="Listener"){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Lister2()));
            }
          else{
              Navigator.of(context).pushNamed('/Price3');
            }

          else
            toast("Please select details first");
        },
      ),
    ));
  }
}
