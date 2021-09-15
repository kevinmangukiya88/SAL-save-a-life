import 'package:flutter/material.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/constant/AppColor.dart';
import 'package:mental_health/data/repo/GetAvailableAssessments.dart';
import 'package:mental_health/models/GetAvailableAssessmentModal.dart';
import 'Assesmentdetail.dart';

class Assessments extends StatefulWidget {
  const Assessments({Key key}) : super(key: key);

  @override
  _AssessmentsState createState() => _AssessmentsState();
}

class _AssessmentsState extends State<Assessments> {
  var getAssessment  = GetAvailableAssessmentRepo();
  List<AssessmentsList> assessmentModal = new List();
  bool isloading = true;
  List<String> imagesAssessments = [
    'https://getthematic.com/insights/content/images/wordpress/2018/04/shutterstock_730381336.jpg',
    'https://media.istockphoto.com/photos/silhouette-of-troubled-person-head-picture-id1064027420?k=6&m=1064027420&s=612x612&w=0&h=vRTOtWXLm89Ez3mxyJOOG7wJ4XqiGN-0eUUWpiIs48M=',
    'https://images.unsplash.com/photo-1569437061241-a848be43cc82?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bWVudGFsJTIwaGVhbHRofGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1569437061241-a848be43cc82?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bWVudGFsJTIwaGVhbHRofGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'
  ];

  List<String> cardTitle = [
    'Self resilience survey',
    'Perceived stress scale-\nStress in general',
    'Self resilience survey',
    'Self resilience survey'
  ];

  List<Color> colors = [
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(48, 37, 33, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75)
  ];

  List<String> time = ['3-5', '10-15', '3-5', '10-15'];

  @override
  void initState() {
    super.initState();
    isloading = true;
    getAssessment
        .getAssessment(
      context: context,
    )
        .then((value) {
      if (value != null) {
        if (value.meta.status == "200") {
          setState(() {
            isloading = false;
            assessmentModal.addAll(value.assessments);
          });
        } else {
          setState(() {
            isloading = false;
          });
          showAlertDialog(
            context,
            value.meta.message,
            "",
          );
        }
      } else {
        setState(() {
          isloading = false;

        });
        showAlertDialog(
          context,
          value.meta.message,
          "",
        );
      }
    }).catchError((error) {
      setState(() {
        isloading = false;
      });
      showAlertDialog(
        context,
        error.toString(),
        "",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> widgetList = new List<Widget>();
    var child = SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Assessments",
          style: TextStyle(
            color: Color(midnightBlue),
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(midnightBlue),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02,
                  vertical: SizeConfig.blockSizeVertical * 2),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AssesmantDetail()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical),
                      width: SizeConfig.screenWidth * 0.4,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image:
                                Image.network(imagesAssessments[index]).image,
                            fit: BoxFit.cover),
                      ),
                      child: Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.25,
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: SizeConfig.screenWidth,
                          padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.02,
                              right: SizeConfig.screenWidth * 0.02),
                          height: SizeConfig.blockSizeVertical * 8,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: colors[index],
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cardTitle[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                time[index] + " mins",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                itemCount:assessmentModal != null && assessmentModal.length > 0 ?  assessmentModal.length : 0,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    ));
    widgetList.add(child);
    if (isloading) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          new Center(
            child: new CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(colorPrimary),
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(children: widgetList);
  }
}
