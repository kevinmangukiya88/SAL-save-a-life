import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/HomeMain.dart';
import 'package:mental_health/UI/Price1.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/Dialogs.dart';
import 'package:mental_health/Utils/SharedPref.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/constant/AppColor.dart';
import 'package:mental_health/data/repo/sendOtpRepo.dart' as send;
import 'package:mental_health/data/repo/verifyOtpRepo.dart';
import 'package:mental_health/models/VerifyOtpModal.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPScreen({Key key, this.phoneNumber}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<State> loginLoader = new GlobalKey<State>();

bool selected = false;
  FocusNode firstDigit;
  FocusNode secondDigit;
  FocusNode thirdDigit;
  FocusNode fourthDigit;
  FocusNode fifthDigit;
  FocusNode sixthDigit;
  var digit;
  var verifyOtp = VerifyOtpRepo();
  var sendOtp = send.SendOtptoPhone();

  TextEditingController firstController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstDigit = FocusNode();
    secondDigit = FocusNode();
    thirdDigit = FocusNode();
    fourthDigit = FocusNode();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    firstController.dispose();
    firstDigit.dispose();
    secondDigit.dispose();
    thirdDigit.dispose();
    fourthDigit.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton:FloatingActionButton(
          child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
          backgroundColor: selected == true? Colors.blue : Colors.grey,
            onPressed: () async {
              if (digit.isNotEmpty
                ) {
    Dialogs.showLoadingDialog(context, loginLoader);
     {
      final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/verifyotp?phone=${widget.phoneNumber}&otp=${digit}';
      var response = await Dio().get(uri,
          // queryParameters:
          // {'phone': phone, 'otp': otp},
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
            followRedirects: false,
          ));
      try {
        if (response.data['meta']['status'] != null) {
          print(uri.toString());
          print(response.data['meta']['status']);
          if(response.data['meta']['status']=="200"){
            print("ewjnlad");
            print(response.data);
            // Navigator.push(context, MaterialPageRoute(builder: (conext){
            //   return Price1(getOtp:  firstController.text
            //   );
            // }));
            if(response.data['listener']!=null){
              SharedPreferences prefs=await SharedPreferences.getInstance();
              prefs.setString("therapistid",response.data['listener']['listener_id'] );
              prefs.remove("firstname");
              prefs.remove("lastname");
              prefs.setString("firstname",response.data['listener']['first_name']  );
              prefs.setString("lastname",response.data['listener']['last_name']  );
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeMain()));

            }
            else if(response.data['therapist']!=null){
              SharedPreferences prefs=await SharedPreferences.getInstance();
              prefs.setString("type", "Therapist");
              prefs.setString("therapistid",response.data['therapist']['therapist_id'] );
              prefs.remove("firstname");
              prefs.remove("lastname");
              prefs.setString("firstname",response.data['therapist'] ['first_name']);
              prefs.setString("lastname",response.data['therapist']['last_name']);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeMain()));

            }
            else{
     Navigator.push(context, MaterialPageRoute(builder: (conext){
                          return Price1(getOtp:  firstController.text
                          );
                        }));
           }

          }
          else{
            print("ewjnawalad");
            Navigator.of(loginLoader.currentContext,
                rootNavigator: true)
                .pop();
            print(response.data['meta']['message']);
            showAlertDialog(
              context,
              response.data['meta']['message'],
              "",
            );
          }

          final passEntity = VerifyOtpModal.fromJson(response.data);

          return passEntity;
        } else {
          return VerifyOtpModal(meta: response.data);
        }
      } catch (error, stacktrace) {}
    }
//                 verifyOtp
//                     .verifyOtp(
//                   context: context,
//                   phone: widget.phoneNumber,
//                   otp: digit
//
//                 ).then((value) async {
//                   if (value != null) {
// print(widget.phoneNumber);
//                     if (value.meta.status == "200") {
//                       Navigator.of(loginLoader.currentContext,
//                           rootNavigator: true)
//                           .pop();
// print(value.listener);
//                       if(value.therapist!=null||value.listener!=null){
//                         if(value.therapist!=null){
//                           SharedPreferences prefs=await SharedPreferences.getInstance();
//                           prefs.setString("therapistid",value.therapist.therapistId );
//                           prefs.remove("firstname");
//                           prefs.remove("lastname");
//                           prefs.setString("firstname",value.therapist.firstName );
//                           prefs.setString("lastname",value.therapist.lastName );
//                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeMain()));
//
//                         }else{
//                           SharedPreferences prefs=await SharedPreferences.getInstance();
//                           prefs.setString("therapistid",value.listener.listener_id );
//                           prefs.remove("firstname");
//                           prefs.remove("lastname");
//                           prefs.setString("firstname",value.listener.firstName );
//                           prefs.setString("lastname",value.listener.lastName );
//                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeMain()));
//
//                         }
//
//                       }
//                       else{
//
//                         Navigator.push(context, MaterialPageRoute(builder: (conext){
//                           return Price1(getOtp:  firstController.text
//                           );
//                         }));
//
//                       }
//                       print(value.mediaUrl);
//                       toast(value.meta.message);
//
//
//
//                     } else {
//                       firstController.clear();
//
//                       Navigator.of(loginLoader.currentContext,
//                           rootNavigator: true)
//                           .pop();
//                       showAlertDialog(
//                         context,
//                         value.meta.message,
//                         "",
//                       );
//                     }
//                   } else {
//                     Navigator.of(loginLoader.currentContext,
//                         rootNavigator: true)
//                         .pop();
//                     showAlertDialog(
//                       context,
//                       value.meta.message,
//                       "",
//                     );
//                   }
//                 }).catchError((error) {
//                   Navigator.of(loginLoader.currentContext,
//                       rootNavigator: true)
//                       .pop();
//                   showAlertDialog(
//                     context,
//                     error.toString(),
//                     "",
//                   );
//                 });
//               }else{
//                 toast("Otp is required");
//               }

    }} ),
        body: Container(
          margin: EdgeInsets.only(
            left: SizeConfig.screenWidth * 0.05,
            right: SizeConfig.screenWidth * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter your \nVerification Code",style:
                GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                  color: Color(fontColorSteelGrey),
                ),),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              Text("Sent to ${widget.phoneNumber}",style:
              GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.blockSizeVertical * 1.5,
                color: Color(fontColorGray),
              ),),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
          //
          //   color: Colors.transparent,
          //   child: PinCodeTextField(
          //     controller: firstController,
          //     keyboardType: TextInputType.number,
          //     appContext: context,
          //     length: 4,
          //     onChanged: (value) {
          //      setState(() {
          //        firstController.text = value;
          //        selected = true;
          //      });
          //       /*     controller.otpController.value.text =
          //                         value.toString();*/
          //     },
          //     backgroundColor: Colors.transparent,
          //     pinTheme: PinTheme(
          //         inactiveColor: Color(backgroundColorBlue), borderWidth: 4),
          //     textStyle: TextStyle(
          //         color: colorBlack,
          //         fontSize: 34,
          //         fontWeight: FontWeight.bold),
          //   ),
          // ),
              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,

                fieldWidth: 55,
              //  otpFieldStyle: OtpFieldStyle(focusBorderColor:Color(backgroundColorBlue),borderColor:Color(backgroundColorBlue),disabledBorderColor: Color(backgroundColorBlue),enabledBorderColor: Color(backgroundColorBlue)),
                fieldStyle: FieldStyle.underline,
           //     outlineBorderRadius: 20,

                style: TextStyle(fontSize: 17),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                  setState(() {
                    selected=true;
                  });
                  digit=pin;
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ProfessionalInfo1()));
                },
              ),


/*              Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      margin: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: firstController,
                        focusNode: firstDigit,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 3.75,
                            fontWeight: FontWeight.bold
                        ),
                        onSubmitted: (term){
                          firstDigit.unfocus();
                          FocusScope.of(context).requestFocus(secondDigit);
                        },
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      margin: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: secondController,
                        focusNode: secondDigit,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],                      keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 3.75,
                            fontWeight: FontWeight.bold
                        ),
                        onSubmitted: (term){
                          secondDigit.unfocus();
                          FocusScope.of(context).requestFocus(thirdDigit);
                        },
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      margin: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: thirdController,
                        focusNode: thirdDigit,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 3.75,
                            fontWeight: FontWeight.bold
                        ),
                        onSubmitted: (term){
                          thirdDigit.unfocus();
                          FocusScope.of(context).requestFocus(fourthDigit);
                        },
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      margin: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: fourthController,
                        focusNode: fourthDigit,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 3.75,
                            fontWeight: FontWeight.bold
                        ),
                        onChanged: (v){
                          setState(() {
                            selected = true;
                          });
                        },
                        onSubmitted: (term){
                          fourthDigit.unfocus();
                          FocusScope.of(context).requestFocus(fifthDigit);
                        },),
                    ),
                  ],
                ),
              )*/
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1.5,
              ),
              GestureDetector(
                onTap: (){
                  Dialogs.showLoadingDialog(
                      context, loginLoader);
                  firstController.clear();
                  sendOtp
                      .sendOtp(
                    context: context,
                    phone: widget.phoneNumber,
                  )
                      .then((value) {
                    if (value != null) {
                      if (value.meta.status == "200") {
                        Navigator.of(loginLoader.currentContext,
                            rootNavigator: true)
                            .pop();
                        toast("OTP sent sucessfully");
                        /*  SharedPreferencesTest().checkIsLogin("0");
                                          SharedPreferencesTest()
                                              .saveToken("set", value: value.token);*/
                      } else {
                        Navigator.of(loginLoader.currentContext,
                            rootNavigator: true)
                            .pop();
                        showAlertDialog(
                          context,
                          value.meta.message,
                          "",
                        );
                      }
                    } else {
                      Navigator.of(loginLoader.currentContext,
                          rootNavigator: true)
                          .pop();
                      showAlertDialog(
                        context,
                        value.meta.message,
                        "",
                      );
                    }
                  }).catchError((error) {
                    Navigator.of(loginLoader.currentContext,
                        rootNavigator: true)
                        .pop();
                    showAlertDialog(
                      context,
                      error.toString(),
                      "",
                    );
                  });
                },
                child: Text("RESEND OTP",style:
                GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                  color: Color(backgroundColorBlue),
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
