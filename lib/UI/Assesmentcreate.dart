import 'package:flutter/material.dart';
import 'package:mental_health/Utils/Colors.dart';

import 'AssesmentQuiz.dart';

class Assesmentcreate extends StatefulWidget {
  @override
  _AssesmentcreateState createState() => _AssesmentcreateState();
}

class _AssesmentcreateState extends State<Assesmentcreate> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "Name",
              style: TextStyle(color: Color(fontColorGray), fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  focusColor: Color(fontColorGray),
                  hoverColor: Color(fontColorGray),
                  hintStyle: TextStyle(
                    color: Color(midnightBlue),
                  ),
                  hintText: "Enter Event Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 42, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(fontColorGray)),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(fontColorGray)),
                    gapPadding: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(fontColorGray)),
                    gapPadding: 10,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Age",
              style: TextStyle(color: Color(fontColorGray), fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  focusColor: Color(fontColorGray),
                  hoverColor: Color(fontColorGray),
                  hintStyle: TextStyle(
                    color: Color(midnightBlue),
                  ),
                  hintText: "Enter Age",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 42, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(fontColorGray)),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(fontColorGray)),
                    gapPadding: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(fontColorGray)),
                    gapPadding: 10,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Gender",
              style: TextStyle(color: Color(fontColorGray), fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  focusColor: Color(fontColorGray),
                  hoverColor: Color(fontColorGray),
                  hintStyle: TextStyle(
                    color: Color(midnightBlue),
                  ),
                  hintText: "Enter Gender",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 42, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(fontColorGray)),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(fontColorGray)),
                    gapPadding: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(fontColorGray)),
                    gapPadding: 10,
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox(height: 40,)),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                child: Text("Next"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
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
