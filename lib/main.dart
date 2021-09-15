import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health/UI/AddNewEvent.dart';
import 'package:mental_health/UI/upcomingAppointments.dart';
import 'package:mental_health/UI/AboutSAL.dart';
import 'package:mental_health/UI/Assessments.dart';
import 'package:mental_health/UI/AvailabilityFirst.dart';
import 'package:mental_health/UI/Availabilty1.dart';
import 'package:mental_health/UI/CafeEvents.dart';
import 'package:mental_health/UI/CafeEventsDetails.dart';
import 'package:mental_health/UI/EventSuccessful.dart';
import 'package:mental_health/UI/EventSummary.dart';
import 'package:mental_health/UI/PastAppointments.dart';
import 'package:mental_health/UI/Cafe3.dart';
import 'package:mental_health/UI/ExploreAll.dart';
import 'package:mental_health/UI/Help.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/UI/HomeMain.dart';
import 'package:mental_health/UI/Info%203.dart';
import 'package:mental_health/UI/Info1.dart';
import 'package:mental_health/UI/Info2.dart';
import 'package:mental_health/UI/KYCScreen.dart';
import 'package:mental_health/UI/MyContent.dart';
import 'package:mental_health/UI/MyProfile.dart';
import 'package:mental_health/UI/OTPScreen.dart';
import 'package:mental_health/UI/Payment.dart';
import 'package:mental_health/UI/Price1.dart';
import 'package:mental_health/UI/Price2.dart';
import 'package:mental_health/UI/Price3.dart';
import 'package:mental_health/UI/Price4.dart';
import 'package:mental_health/UI/Price5.dart';
import 'package:mental_health/UI/ProfessionalInfo1.dart';
import 'package:mental_health/UI/ProfessionalInfo2.dart';
import 'package:mental_health/UI/Settings.dart';
import 'package:mental_health/models/VerifyOtpModal.dart';
import 'package:mental_health/show_times.dart';
import 'package:nb_utils/nb_utils.dart';
import 'UI/CancelAppointment.dart';
import 'UI/LoginScreen.dart';
import 'UI/stremusingapi.dart';
import 'Utils/SharedPref.dart';
import 'demo.dart';

Therapist getTherapistData;
void main() {
  runApp(MentalHealth());
}

class MentalHealth extends StatefulWidget {
  @override
  _MentalHealthState createState() => _MentalHealthState();
}

class _MentalHealthState extends State<MentalHealth> {
  String _textFromFile;
  @override
  void initState() {
    super.initState();
    getdetail();
    getlogintoken().then((val) {
      setState(() {
        // _textFromFile = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Mental Health",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'OpenSans',
        ),
        home: _textFromFile != null ? HomeMain() : LoginScreen(),
        routes: {
          '/Login': (context) => LoginScreen(),
          '/OTP': (context) => OTPScreen(),
          '/Price1': (context) => Price1(),
          '/Price2': (context) => Price2(),
          '/Price3': (context) => Price3(),
          '/ProfessionalInfo1': (context) => ProfessionalInfo1(),
          '/ProfessionalInfo2': (context) => ProfessionalInfo2(),
          '/Info1': (context) => Info1(),
          '/Info2': (context) => Info2(),
          '/Info3': (context) => Info3(),
          '/Price4': (context) => Price4(),
          '/Price5': (context) => Price5(),
          '/Cafe1': (context) => AppointmentsScreen(),
          '/Cafe2': (context) => Cafe2(),
          '/Cafe3': (context) => Cafe3(),
          '/MyProfile': (context) => MyProfile(),
          '/CancelAppointment': (context) => CancelAppointment(),
          '/MyContent': (context) => MyContent(),
          '/Home2': (context) => Home2(),
          '/KYC': (context) => KYCScreen(),
          '/HomeMain': (context) => HomeMain(),
          '/ExploreAll': (context) => ExploreAll(),
          '/Availability1': (context) => Availability(),
          '/Assessments': (context) => Assessments(),
          '/Payments': (context) => Payment(),
          '/AboutSAL': (context) => AboutSAL(),
          '/Help': (context) => Help(),
          '/Settings': (context) => Settings(),
          // '/AvailabilityFirst': (context) => AvailabilityFirst(),
          '/AvailabilityFirst': (context) => Demo(),
          '/CafeEvents': (context) => CafeEvents(),
          '/CafeEventsDetails': (context) => CafeEventsDetails(),
          '/AddNewEvent': (context) => AddNewEvent(),
          '/EventSummary': (context) => EventSummary(),
          '/EventSuccess': (context) => EventSuccessful(),
        });
  }

  Future<String> getlogintoken() async {
    {
      var login = await SharedPreferencesTest().checkIsLogin("1");
      return login;
    }
  }

  Future<void> getdetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _textFromFile = prefs.getString("therapistid");
  }

  ///controller initialize
  ShowTimesController _controller = Get.put(ShowTimesController());
}
