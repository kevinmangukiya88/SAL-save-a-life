import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mental_health/UI/CafeEventsDetails.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:nb_utils/nb_utils.dart';

class CafeAllevents extends StatefulWidget{
  @override
  _CafeAlleventsState createState() => _CafeAlleventsState();
}

class _CafeAlleventsState extends State<CafeAllevents> {
  List<String> images = ['https://wallpaperaccess.com/full/1691795.jpg',
    'https://luna1.co/020fe1.png',
    'https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2019/11/parenting-hacks-1574674152.jpg',
    'https://wallpaperaccess.com/full/1691795.jpg',
    'https://luna1.co/020fe1.png',
    'https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2019/11/parenting-hacks-1574674152.jpg'];

  List<String> topic = ['Work & Stress Workshop',
    'Mental Health Workshop',
    'Parenting Workshop',
    'Work & Stress Workshop',
    'Mental Health Workshop',
    'Parenting Workshop'];
bool isError = false;
  bool isLoading = false;
  List<Color> colors = [Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(48, 37, 33, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75)];
@override
  void initState() {
  getAllevents();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return  Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.02,
          vertical: SizeConfig.blockSizeVertical * 2
      ),
      child: ListView(children: eventWidget(),));
  }
  dynamic event=new List();
  void getAllevents()async {
    setState(() {
      isLoading=true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var type;
    if(prefs.getString("type")=="Therapist"){
      type="therapist";
    }
    else{
      type="counsellor";
    }
    print(type);
    try {
      final response = await get(Uri.parse('https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/${type}/events'));
      print("bjkb" + response.body.toString());
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);

event=responseJson['events'];
        setState(() {
          isError = false;
          isLoading = false;
          print('setstate');
        });


      } else {
        print("bjkb" + response.statusCode.toString());
        // showToast("Mismatch Credentials");
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        isError = true;
        isLoading = false;
      });
      showAlertDialog(
        context,
        e.toString(),
        "",
      );
    }
  }

  List <Widget> eventWidget(){
    List<Widget>eventlist=new List();
    for(int i=0; i<event.length;i++){
      eventlist.add(GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CafeEventsDetails(id:event[i]['order_id'])));
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical
          ),
          width: SizeConfig.screenWidth * 0.4,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: Image.network(images[2]).image,
                fit: BoxFit.cover
            ),
          ),
          child: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.25,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: SizeConfig.screenWidth,
              padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.02,
                  right: SizeConfig.screenWidth * 0.02
              ),
              height: SizeConfig.blockSizeVertical * 8,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: colors[2],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(event[i]['title'],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(event[i]['date'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeVertical * 1.5
                        ),),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 10,
                      ),
                      Text("• \t ${event[i]['time']} • \t",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeVertical * 1.5
                        ),),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 10,
                      ),
                      Text("₹ ${event[i]['price']}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeVertical * 1.5
                        ),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),);


  }
    return eventlist;
}}