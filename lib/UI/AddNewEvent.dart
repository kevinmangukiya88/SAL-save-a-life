import 'dart:convert';
import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_health/UI/EventSummary.dart';
import 'package:mental_health/Utils/ActionSheet.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/Dialogs.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/controller/availability_controller.dart';
import 'package:mental_health/data/repo/uploadcreateevent.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' as utils;
import 'package:mental_health/data/repo/AddEventRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:mental_health/models/get_topics_response_model.dart';

TextEditingController eventName = TextEditingController();
TextEditingController eventDesc = TextEditingController();
TextEditingController eventTopic = TextEditingController();
TextEditingController eventDate = TextEditingController();
TextEditingController eventTime = TextEditingController();
int priceValue = 50;

class AddNewEvent extends StatefulWidget {
  const AddNewEvent({Key key}) : super(key: key);

  @override
  _AddNewEventState createState() => _AddNewEventState();
}

class _AddNewEventState extends State<AddNewEvent> {
  File image;
  String selectedImg;
  bool isLoading = false;
  GlobalKey<FormState> newEventFormKey = GlobalKey<FormState>();
  String topic;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTimeFrom = TimeOfDay(hour: 00, minute: 00);
  String _setTime;
  String _hourFrom, _minuteFrom, _timeFrom;
  String dateTimeFrom;

  FocusNode eventNameFn;
  FocusNode eventDescFn;
  FocusNode eventTopicFn;
  FocusNode eventDateFn;
  FocusNode eventTimeFn;

  GetTopicsResponseModel result;

  @override
  void initState() {
    // TODO: implement initState
    eventNameFn = FocusNode();
    eventDescFn = FocusNode();
    eventTopicFn = FocusNode();
    eventDateFn = FocusNode();
    eventTimeFn = FocusNode();
    getTopics();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eventNameFn.dispose();
    eventDescFn.dispose();
    eventTopicFn.dispose();
    eventDateFn.dispose();
    eventTimeFn.dispose();
  }

  final GlobalKey<State> loginLoader = new GlobalKey<State>();

  Future<void> getTopics() async {
    String url =
        'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/topic';
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        GetTopicsResponseModel data =
            getTopicsResponseModelFromJson(response.body);
        print('Response :${response.body}');
        print('Response Meta:${data.meta?.status}');
        if (data.meta.status == '200') {
          result = data;
        }
      } else {
        result = null;
      }
    } catch (e) {
      print('get topic error :$e');
      result = null;
    }
    setState(() {});
  }

  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });

    eventDate.text = DateFormat.yMd().format(selectedDate);
  }

  Future<Null> _selectFromTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeFrom,
    );
    if (picked != null)
      setState(() {
        selectedTimeFrom = picked;
        _hourFrom = selectedTimeFrom.hour.toString();
        _minuteFrom = selectedTimeFrom.minute.toString();
        _timeFrom = _hourFrom + ' : ' + _minuteFrom;
        eventTime.text = _timeFrom;
        eventTime.text = formatDate(
            DateTime(
                2019, 08, 1, selectedTimeFrom.hour, selectedTimeFrom.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Material(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "New Event",
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
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: newEventFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: Text(
                            "Event Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(fontColorGray),
                            ),
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: TextFormField(
                            focusNode: eventNameFn,
                            controller: eventName,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(12),
                              hintText: "Enter Event Name",
                              hintStyle: TextStyle(
                                  color: Color(fontColorGray),
                                  fontWeight: FontWeight.w400,
                                  fontSize:
                                      SizeConfig.blockSizeVertical * 1.75),
                            ),
                            onFieldSubmitted: (value) {
                              eventNameFn.unfocus();
                              FocusScope.of(context).requestFocus(eventDescFn);
                            },
                            validator: (s) {
                              if (s.isEmpty) return "This field is required";
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: Text(
                            "Event Description",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(fontColorGray),
                            ),
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: TextFormField(
                            focusNode: eventDescFn,
                            controller: eventDesc,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Color(fontColorGray)),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(12),
                              hintText: "Enter Event Description",
                              hintStyle: TextStyle(
                                  color: Color(fontColorGray),
                                  fontWeight: FontWeight.w400,
                                  fontSize:
                                      SizeConfig.blockSizeVertical * 1.75),
                            ),
                            onFieldSubmitted: (value) {
                              eventDescFn.unfocus();
                              FocusScope.of(context).requestFocus(eventTopicFn);
                            },
                            validator: (s) {
                              if (s.isEmpty) return "This field is required";
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: Text(
                            "Topic",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(fontColorGray),
                            ),
                          ),
                        ),
                        result == null
                            ? SizedBox()
                            : Container(
                                width: SizeConfig.screenWidth,
                                margin: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.screenWidth * 0.03,
                                    vertical: SizeConfig.blockSizeVertical),
                                child: DropdownButtonFormField<String>(
                                  focusNode: eventTopicFn,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Color(fontColorGray)),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Color(fontColorGray)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Color(fontColorGray)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Color(fontColorGray)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Color(fontColorGray)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Color(fontColorGray)),
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(12),
                                  ),
                                  items: result.topics
                                      .map((e) => DropdownMenuItem<String>(
                                            value: e.id,
                                            onTap: () {
                                              eventTopic.text = e.id;
                                            },
                                            child: Text(
                                              e.topic,
                                              style: TextStyle(
                                                  color: Color(midnightBlue),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      2),
                                            ),
                                          ))
                                      .toList(),
                                  hint: Text(
                                    "Select a Topic",
                                    style: TextStyle(
                                        color: Color(fontColorGray),
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.75,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(fontColorGray),
                                  ),
                                  value: topic,
                                  onChanged: (value) {
                                    setState(() {
                                      topic = value;
                                    });
                                  },
                                ),
                              ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: Text(
                            "Date",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(fontColorGray),
                            ),
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: InkWell(
                            child: IgnorePointer(
                              child: TextFormField(
                                focusNode: eventDateFn,
                                controller: eventDate,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: "Select Date",
                                  hintStyle: TextStyle(
                                      color: Color(fontColorGray),
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.75),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.zero,
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color(fontColorGray),
                                    ),
                                  ),
                                ),
                                onFieldSubmitted: (value) {
                                  eventDateFn.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(eventTimeFn);
                                },
                                onTap: () {
                                  selectDate(context);
                                },
                              ),
                            ),
                            onTap: () {
                              selectDate(context);
                            },
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: Text(
                            "Time",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(fontColorGray),
                            ),
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: InkWell(
                            child: IgnorePointer(
                              child: TextFormField(
                                focusNode: eventTimeFn,
                                controller: eventTime,
                                onChanged: (String val) {
                                  _setTime = val;
                                  eventTime.text = _setTime;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(fontColorGray)),
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: "Select Time",
                                  hintStyle: TextStyle(
                                      color: Color(fontColorGray),
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.75),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.zero,
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color(fontColorGray),
                                    ),
                                  ),
                                ),
                                onFieldSubmitted: (value) {
                                  eventTimeFn.unfocus();
                                },
                                textInputAction: TextInputAction.done,
                                onTap: () {
                                  _selectFromTime(context);
                                },
                              ),
                            ),
                            onTap: () {
                              _selectFromTime(context);
                            },
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: Row(
                            children: [
                              Text(
                                "Price Per Ticket",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(fontColorGray),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '₹ $priceValue',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(fontColorGray),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: Slider(
                            min: 0,
                            max: 2500,
                            divisions: 50,
                            value: priceValue.toDouble(),
                            label: priceValue.toString(),
                            activeColor: Color(backgroundColorBlue),
                            inactiveColor:
                                Color(fontColorGray).withOpacity(0.5),
                            onChanged: (value) {
                              setState(() {
                                priceValue = value.round();
                              });
                            },
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: Text(
                            "EVENT IMAGE",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(fontColorGray),
                            ),
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.blockSizeVertical),
                          child: MaterialButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) => ActionSheet()
                                    .actionSheet(context, type: "profile",
                                        onCamera: () {
                                  FocusScope.of(context).unfocus();
                                  chooseCameraFile().then((File file) {
                                    if (file != null) {
                                      selectedImg = file.path;
                                    }
                                  });
                                }, onGallery: () {
                                  FocusScope.of(context).unfocus();
                                  androidchooseImageFile().then((file) {
                                    if (file != null) {
                                      selectedImg = file.path;
                                    }
                                  }).catchError((onError) {});
                                }, text: "Select profile"),
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Color(backgroundColorBlue),
                                )),
                            child: Text(
                              "Add image",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(backgroundColorBlue)),
                            ),
                          ),
                        ),
                        selectedImg == null
                            ? SizedBox()
                            : Center(
                                child: Image.file(
                                  File(selectedImg),
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.fill,
                                ),
                              ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomSheet: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(7),
                    topLeft: Radius.circular(7),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 9.0,
                        spreadRadius: 4,
                        offset: Offset(1, 1)),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.04,
                            top: SizeConfig.blockSizeVertical * 2),
                        child: Row(
                          children: [
                            Text(
                              "Price For Event",
                              style: TextStyle(
                                color: Color(fontColorGray),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 3,
                            ),
                            Icon(
                              Icons.info_outline_rounded,
                              color: Color(fontColorGray),
                              size: SizeConfig.blockSizeVertical * 2,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: SizeConfig.screenWidth * 0.03),
                        child: Text(
                          '₹ $priceValue',
                          style: TextStyle(
                            color: Color(backgroundColorBlue),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    child: MaterialButton(
                      onPressed: () {
                        if (newEventFormKey.currentState.validate()) {
                          if (eventTime.text.isNotEmpty &&
                              eventDate.text.isNotEmpty &&
                              eventTopic.text.isNotEmpty) {
                            print('img:$selectedImg');
                            if (selectedImg == null || selectedImg == '') {
                              utils.toast("Please add event image");
                              return;
                            }
                            addEvent();
                          } else {
                            utils.toast("All Fields are required");
                          }
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Color(backgroundColorBlue),
                      minWidth: SizeConfig.screenWidth * 0.5,
                    ),
                  )
                ],
              ),
            ),
          ),
          !isLoading
              ? SizedBox()
              : Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black26,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
        ],
      ),
    ));
  }

  Future<void> addEvent() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("therapistid");
    String img = await UploadImageRepo.uploadImage(image: selectedImg);
    print('IMAGE:$img');
    if (img == null) {
      Get.showSnackbar(GetBar(
        message: 'Image not upload please try again',
        duration: Duration(seconds: 2),
      ));
      setState(() {
        isLoading = false;
      });
      return;
    }

    print('ID:$id');
    Map<String, String> body = {
      "counsellor_id": id,
      // "counsellor_id": '035nsa7a',
      "date": DateFormat('yyyy-MM-dd').format(selectedDate),
      "description": eventDesc.text,
      "duration": "10",
      "photo": img,
      "price": priceValue.toString(),
      "time": eventTime.text,
      "title": eventName.text,
      // "topic_id": eventTopic.text
      "topic_id": '12'
    };
    print('BODY:${jsonEncode(body)}');
    bool status = await AddEventRepo.addEvent(body: body);
    setState(() {
      isLoading = false;
    });
    if (status) {
      Get.to(EventSummary(
        result: result,
      ));
    }
  }

  Future<File> chooseCameraFile() async {
    await ImagePicker.pickImage(
      source: ImageSource.camera,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        image = new File(value.path);
      });
      if (image.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return image;
  }

  Future<File> androidchooseImageFile() async {
    await ImagePicker.pickImage(
      source: ImageSource.gallery,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        image = new File(value.path);
      });
      if (image.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return image;
  }
}
