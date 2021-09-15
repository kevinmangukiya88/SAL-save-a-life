import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/ListTileCafe2.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/constant/AppColor.dart';
import 'package:mental_health/data/repo/PastAppointsmentsRepo.dart';
import 'package:mental_health/models/AppointmentModal.dart';

class Cafe2 extends StatefulWidget {
  const Cafe2({Key key}) : super(key: key);
  @override
  _Cafe2State createState() => _Cafe2State();
}

class _Cafe2State extends State<Cafe2> {
  var pastAppointmentsRepo = PastAppointmentsRepo();
  bool isloading = false;
  List<Appointment> appointments = new List();

  @override
  void initState() {
    super.initState();
    isloading = true;
    pastAppointmentsRepo
        .pastAppointmentRepo(
       context,
    ).then((value) {
      if (value != null) {
        if (value.meta.status == "200") {
          setState(() {
            isloading = false;
          });
          appointments.addAll(value.appointments);
          //toast(value.meta.message);
          /*  SharedPreferencesTest().checkIsLogin("0");
                                          SharedPreferencesTest()
                                              .saveToken("set", value: value.token);*/

          /*  Navigator.push(context,
              MaterialPageRoute(
                  builder: (conext) {
                    return OTPScreen(
                      phoneNumber: mobileController.text,
                    );
                  }));*/
        } else {
          showAlertDialog(
            context,
            value.meta.message,
            "",
          );
        }
      } else {
        showAlertDialog(
          context,
          value.meta.message,
          "",
        );
      }
    }).catchError((error) {
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
/*      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        currentIndex: 1,
        unselectedItemColor: Color(fontColorGray),
        selectedLabelStyle: GoogleFonts.openSans(
          color: Colors.blue,
        ),
        unselectedLabelStyle: GoogleFonts.openSans(color: Color(fontColorGray)),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  'assets/icons/nav home.png',
                  scale: SizeConfig.blockSizeVertical * 0.6,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  'assets/icons/nav booking.png',
                  scale: SizeConfig.blockSizeVertical * 0.6,
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical),
              ),
              label: "Booking"),
          BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  'assets/icons/nav explore.png',
                  scale: SizeConfig.blockSizeVertical * 0.6,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical),
              ),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  'assets/icons/nav cafe.png',
                  scale: SizeConfig.blockSizeVertical * 0.6,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical),
              ),
              label: "Cafe"),
        ],
      )*/
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "EARLIER",
              style: GoogleFonts.openSans(
                color: Color(fontColorGray),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 80,
              child: appointments != null && appointments.length > 0
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return appointments != null && appointments.length > 0
                            ? listTileCafe2(context, "Kriti Singh", "17:00")
                            : Container(
                                child: Center(
                                    child: Text(
                                  "No Past Appointments",
                                  style: TextStyle(color: Colors.black),
                                )),
                              );
                      },
                      itemCount: appointments.length,
                    )
                  : Container(
                      child: Center(
                          child: Text(
                        "No Past Appointments",
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
            )
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
