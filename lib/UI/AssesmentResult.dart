import 'package:flutter/material.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/models/GetAvailableAssessmentModal.dart';
import 'package:mental_health/UI/Assessments.dart';

import 'AssesmentQuiz.dart';

class AssesmentResult extends StatefulWidget {
  @override
  _AssesmentResultState createState() => _AssesmentResultState();
}

class _AssesmentResultState extends State<AssesmentResult> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Result",
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
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/bg/Frame.png",
                      ),
                      fit: BoxFit.fitWidth)),
              child: Center(
                  child: Text(
                "You Can Handel Stress work \nat well!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
            ),
            Expanded(child: SizedBox()),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                child: Text("Try Again"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssesmentQuiz()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
