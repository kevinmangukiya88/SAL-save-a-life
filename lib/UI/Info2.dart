import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

import 'Price1.dart';


bool selected = false;
TextEditingController aboutController = TextEditingController();
class Info2 extends StatefulWidget {
  const Info2({Key key}) : super(key: key);

  @override
  _Info2State createState() => _Info2State();
}

class _Info2State extends State<Info2> {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  radioValue.toString()=="Listener"?Text("6/7",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),):Text("7/8",style: GoogleFonts.openSans(
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
        //     child: Text("Skip",style: GoogleFonts.openSans(
        //         color: Colors.blue
        //     ),),
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
              value: 0.8,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.15,
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Text("Please tell us a little about yourself",style: GoogleFonts.openSans(
                  fontSize: SizeConfig.blockSizeVertical * 4,
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey)
              ),),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Container(
              margin:EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              //height: SizeConfig.blockSizeVertical * 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Colors.grey
                  )
              ),
              child: TextFormField(
                controller: aboutController,
                decoration: InputDecoration(
                    hintText: "Enter here",
                    hintStyle: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                    ),
                    border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1)
                ),
                maxLines: 3,
                maxLength: 500,
                onFieldSubmitted: (term){
                  setState(() {
                    selected = true;
                  });
                },
                onChanged: (term){
                  setState(() {
                    selected = true;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
        backgroundColor: selected == true? Colors.blue : Colors.grey,
        onPressed: (){
          Navigator.of(context).pushNamed('/Info3');
        },
      ),
    ));
  }
}
