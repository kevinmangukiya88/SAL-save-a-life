import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Occupation.dart';
import 'Price1.dart';
import 'Price3.dart';
TextEditingController whyController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
class Lister2 extends StatefulWidget{
  @override
  _Lister2State createState() => _Lister2State();
}

class _Lister2State extends State<Lister2> {
  GlobalKey<FormState> nameForm = GlobalKey<FormState>();


  FocusNode firstNameFocusNode;
  FocusNode lastNameFocusNode;
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
       title: radioValue.toString()=="Listener"?Text("2/7",style: GoogleFonts.openSans(
         fontWeight: FontWeight.bold,
         color: Color(fontColorSteelGrey),
       ),):Text("3/7",style: GoogleFonts.openSans(
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
         child: Text("Why You Want To Be Listener",style: GoogleFonts.openSans(
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
                 controller: whyController,
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
                   hintText: "Enter Text",
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

             ],
           ),
         ),
       ),
     ],),),floatingActionButton: FloatingActionButton(
     child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
     backgroundColor: filledFn == true? Colors.blue : Colors.grey,
     onPressed: (){
       if(whyController.text != null && whyController.text != "" && filledFn != "")
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Price3()));
       else
         toast("Please select details first");
     },
   ),
   );
  }
}