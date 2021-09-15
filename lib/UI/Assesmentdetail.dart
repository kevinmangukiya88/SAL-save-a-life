import 'package:flutter/material.dart';
import 'package:mental_health/Utils/Colors.dart';

import 'Assesmentcreate.dart';

class AssesmantDetail extends StatefulWidget {
  @override
  _AssesmantState createState() => _AssesmantState();
}

class _AssesmantState extends State<AssesmantDetail> {
  double size = 18;
  final List<String> _listViewData = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Assessments Detail",
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
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "AIS Workplace Stress Survey",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "The AIS workplace stress was developed in 1198 by the American Institute of Stress Sutvery as a simple screening measure to determine the need of testt",
                  style: TextStyle(color: Color(fontColorGray), fontSize: 14),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Text(
                  "Instruction",
                  style: TextStyle(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "Enter a number from the sliding scale below.\nwhich describes you",
                  style: TextStyle(color: Color(fontColorGray), fontSize: 14),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listViewData.length,
                  itemBuilder: (context, index) => Container(
                    child: GestureDetector(
                      onTap: () => _onSelected(index),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? 20
                                  : size,
                              width: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? 20
                                  : size,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: _selectedIndex != null &&
                                              _selectedIndex == index
                                          ? Colors.blue
                                          : Colors.grey)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(_listViewData[index]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "STRONGLY\nDISAGREE",
                      style:
                          TextStyle(color: Color(fontColorGray), fontSize: 12),
                    ),
                    Text(
                      "SOMEWHAT\nDISAGREE",
                      style:
                          TextStyle(color: Color(fontColorGray), fontSize: 12),
                    ),
                    Text(
                      "STRONGLY\nDISAGREE",
                      style:
                          TextStyle(color: Color(fontColorGray), fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  child: Text("Start"),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Assesmentcreate()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
