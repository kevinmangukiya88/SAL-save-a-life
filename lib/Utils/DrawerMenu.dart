import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/UI/Price2.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/data/repo/getTherapistDetailRepo.dart';
import 'package:mental_health/models/getTherapistDetailModal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AlertDialog.dart';
import 'Colors.dart';
import 'SharedPref.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  bool isloding = false;
  var getHomeContent = GetTherapistDetailRepo();
  var first;
  var last;
  @override
  void initState() {
    getprofile();
    // TODO: implement initState
    super.initState();
  }

  var getHomeContentModal = GetTherapistDetailModal();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.28,
              color: Color(backgroundColorBlue),
              child: Column(
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 3,
                    ),
                    child: CircleAvatar(
                      radius: SizeConfig.blockSizeVertical * 5,
                      child: getHomeContentModal.therapist != null &&
                          getHomeContentModal.therapist.photo !=
                              null &&
                          getHomeContentModal.therapist.photo !=
                              ""
                          ? CachedNetworkImage(
                        imageUrl: getHomeContentModal.mediaUrl +
                            getHomeContentModal.therapist.photo,
                        fit: BoxFit.fill,
                      )
                          : Image.network('https://www.pngitem.com/pimgs/m/421-4212617_person-placeholder-image-transparent-hd-png-download.png'),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2
                    ),
                    child: Text(first.toString()+ " " +  last.toString(),
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 1.5,
                    ),
                    child: Text("Profile complete",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeVertical * 1.5,
                      ),),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 1.5,
                      left: SizeConfig.screenWidth * 0.2,
                      right: SizeConfig.screenWidth * 0.2,
                    ),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.blue,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      value: 0.6,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            ListTile(
              title: Text("My Profile"),
              leading: ImageIcon(Image.asset('assets/icons/user.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/MyProfile');
              },
            ),
            ListTile(
              title: Text("My Availability"),
              leading: ImageIcon(Image.asset('assets/icons/availability.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/AvailabilityFirst');
              },
            ),
            ListTile(
              title: Text("My Content"),
              leading: ImageIcon(Image.asset('assets/icons/content.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/MyContent');
              },
            ),
            ListTile(
              title: Text("Assessments"),
              leading: ImageIcon(Image.asset('assets/icons/assessments.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/Assessments');
              },
            ),
            ListTile(
              title: Text("Payments"),
              leading: ImageIcon(Image.asset('assets/icons/payment.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/Payments');
              },
            ),
            ListTile(
              title: Text("Help"),
              leading: ImageIcon(Image.asset('assets/icons/help.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/Help');
              },
            ),
            ListTile(
              title: Text("About SAL"),
              leading: ImageIcon(Image.asset('assets/icons/about.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/AboutSAL');
              },
            ),
            ListTile(
              title: Text("Settings"),
              leading: ImageIcon(Image.asset('assets/icons/settings.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/Settings');
              },
            ),
          ],
        ),
      ),
    );
  }
  Future<void> getprofile() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    setState(() {

      first =  prefs.getString("firstname");
      last=  prefs.getString("lastname");
    });
  print("klnll"+last);
    getTherapistId();
    //SharedPrfre
  }
  getTherapistId() async {
    SharedPreferencesTest().getTherapistId().then((value) async {
      if (value != null && value != "") {
        setState(() {
          therapistId = value;
          print(therapistId);
        });
        getHomeContent
            .getTherapistDetail(
            context: context,
            therapistId: therapistId
        )
            .then((value) {
          if (value != null) {
            print(value.meta.status);
            if (value.meta.status == "200") {
              setState(() {
                isloding = false;
                getHomeContentModal = value;
                print("jlascjnlsdv"+getHomeContentModal.therapist.photo);
              });
            } else {
              setState(() {
                isloding = false;
              });
              showAlertDialog(
                context,
                value.meta.message,
                "",
              );
            }
          } else {
            setState(() {
              isloding = false;
            });
            showAlertDialog(
              context,
              value.meta.message,
              "",
            );
          }
        }).catchError((error) {
          setState(() {
            isloding = false;
          });
          showAlertDialog(
            context,
            error.toString(),
            "",
          );
        });
      }
    });

// });}}
  }
}
