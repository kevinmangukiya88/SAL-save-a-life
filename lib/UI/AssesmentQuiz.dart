import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'AssesmentResult.dart';

class AssesmentQuiz extends StatefulWidget {
  @override
  _AssesmentQuizState createState() => _AssesmentQuizState();
}

class _AssesmentQuizState extends State<AssesmentQuiz> {
  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
      }
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
      }
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;

      switch (_radioValue3) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
      }
    });
  }

  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;

      switch (_radioValue4) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
      }
    });
  }

  void _handleRadioValueChange5(int value) {
    setState(() {
      _radioValue5 = value;

      switch (_radioValue5) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
        body: new Container(

          child:  ListView(

            shrinkWrap: true,
                children: <Widget>[
                  new Text(
                    'Question 1',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  new Text(
                    'Sadness',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(fontColorGray),
                      fontSize: 18.0,
                    ),
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          new Radio(
                            value: 0,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          new Text(
                            'I do not feel Sad',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          new Radio(
                            value: 1,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          new Text(
                            'I  feel Sad most of the time',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          new Radio(
                            value: 2,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          new Text(
                            'I feel Sad all the time',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          new Radio(
                            value: 3,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          new Text(
                            'I am extremely sad or unhappy',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Question 2',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  new Text(
                    'Persimmium',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(fontColorGray),
                      fontSize: 18.0,
                    ),
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          new Radio(
                            value: 0,
                            groupValue: _radioValue2,
                            onChanged: _handleRadioValueChange2,
                          ),
                          new Text(
                            'I do not feel Sad',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          new Radio(
                            value: 1,
                            groupValue: _radioValue2,
                            onChanged: _handleRadioValueChange2,
                          ),
                          new Text(
                            'I  feel Sad most of the time',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          new Radio(
                            value: 2,
                            groupValue: _radioValue2,
                            onChanged: _handleRadioValueChange2,
                          ),
                          new Text(
                            'I feel Sad all the time',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          new Radio(
                            value: 3,
                            groupValue: _radioValue2,
                            onChanged: _handleRadioValueChange2,
                          ),
                          new Text(
                            'I am extremely sad or unhappy',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      child: Text("Done"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AssesmentResult()));
                      },
                    ),
                  )
                ]),

        ));
  }
}
