import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/NavigationBar.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

import 'CafeAllEvents.dart';

class CafeEvents extends StatefulWidget {
  const CafeEvents({Key key}) : super(key: key);

  @override
  _CafeEventsState createState() => _CafeEventsState();
}

class _CafeEventsState extends State<CafeEvents> {

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

  List<Color> colors = [Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(48, 37, 33, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75)];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(index: 3,),
      body: DefaultTabController(length: 2, child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: TabBar(
            unselectedLabelStyle: TextStyle(
              color: Color(fontColorGray),
              fontWeight: FontWeight.w600,
            ),
            labelStyle: TextStyle(
              color: Color(backgroundColorBlue),
              fontWeight: FontWeight.w700,
            ),
            indicatorColor: Color(backgroundColorBlue),
            labelColor: Color(backgroundColorBlue),
            unselectedLabelColor: Color(fontColorGray),
            tabs: [
              Tab(
                text: "ALL EVENTS",
              ),
              Tab(
                text: "MY EVENTS",
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            CafeAllevents(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.02
                    ),
                    child: MaterialButton(onPressed: (){
                      Navigator.of(context).pushNamed('/AddNewEvent');
                    },
                      minWidth: SizeConfig.screenWidth,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                            color: Color(backgroundColorBlue)
                        ),
                      ),
                      child: Text("SCHEDULE NEW EVENT",
                        style: TextStyle(
                            color: Color(backgroundColorBlue),
                            fontWeight: FontWeight.w600
                        ),),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.02,
                        vertical: SizeConfig.blockSizeVertical * 2
                    ),
                    child: ListView.builder(itemBuilder: (BuildContext context, int index){
                      return InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed('/CafeEventsDetails');
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
                                image: Image.network(images[index]).image,
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
                                  color: colors[index],
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(topic[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  Text(" mins",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                      physics: BouncingScrollPhysics(),
                      primary: true,
                      itemCount: images.length,
                      shrinkWrap: true,),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    ));
  }
}