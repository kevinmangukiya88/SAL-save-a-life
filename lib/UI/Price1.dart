import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/webview.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:nb_utils/nb_utils.dart';


String radioValue = "";
bool selected = false;

class Price1 extends StatefulWidget {
  final String getOtp;
  const Price1({Key key, this.getOtp}) : super(key: key);

  @override
  _Price1State createState() => _Price1State();
}

class _Price1State extends State<Price1> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("1/8",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),),
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios,color: Colors.black,),onTap: ()=>Navigator.pop(context),),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("I am a...",style: GoogleFonts.openSans(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    fontWeight: FontWeight.bold,
                    color: Color(fontColorSteelGrey)
                  ),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewClass(link:"https://sal-foundation.com/about-sal")));
                    },
                    child: Image.asset('assets/icons/info.png',
                    height: SizeConfig.blockSizeVertical * 4,),
                  )
                ],
              ),
            ),
            Container(
              child: RadioListTile<String>(
                  value: "Counselling Therapist", groupValue: radioValue.toString(), onChanged: (String value){
                    setState(() {
                      radioValue = value;
                      print("val" + radioValue.toString());
                      selected = true;
                    });
              },
              title: Text("Counselling Therapist",style: TextStyle(
                color: Color(fontColorGray)
              ),),),
            ),
            Container(
              child: RadioListTile<String>(
                value: "Listener", groupValue: radioValue.toString(), onChanged: (String value){
                setState(() {
                  radioValue = value;
                  print("val" + radioValue.toString());
                  selected = true;
                });
              },
                title: Text("Listener",style: TextStyle(
                    color: Color(fontColorGray)
                ),),),
            ),
            Container(
              child: RadioListTile<String>(
                value: "Alternative Therapist", groupValue: radioValue.toString(), onChanged: (String value){
                setState(() {
                  radioValue = value;
                  print("val" + radioValue.toString());
                  selected = true;
                });
              },
                title: Text("Alternative Therapist",style: TextStyle(
                    color: Color(fontColorGray)
                ),),),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
        backgroundColor: selected == true? Colors.blue : Colors.grey,
        onPressed: (){
          if(radioValue != null && radioValue != "")
          Navigator.of(context).pushNamed('/Price2');
          else
            toast("Please select your profile");
        },
      ),
    ));
  }
}
