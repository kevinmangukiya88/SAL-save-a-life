import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/OTPScreen.dart';
import 'package:mental_health/UI/webview.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/Dialogs.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/data/repo/sendOtpRepo.dart';
import 'package:country_code_picker/country_code_picker.dart';

TextEditingController mobileController = TextEditingController();
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  final GlobalKey<State> loginLoader = new GlobalKey<State>();
  var sendOtp = SendOtptoPhone();
  String countryCode = "91";


  @override
  void initState() {
    super.initState();
    countryCode = "91";
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              color: Color(backgroundColorBlue),
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
            ),
            Container(margin:EdgeInsets.all(50),child: Image.asset('assets/logo/Group.png')),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                ),
              ),
              height: SizeConfig.screenHeight * 0.5,
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.5,
              ),
              child: Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.screenHeight * 0.12,
                  left: SizeConfig.screenWidth * 0.05,
                  right: SizeConfig.screenWidth * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.openSans(
                          color: Color(backgroundColorBlue),
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.blockSizeVertical * 2.5),
                    ),
                    Text(
                      "Log in to continue",
                      style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 1.5,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 4,
                      ),
                      child: Form(
                        key: loginForm,
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: CountryCodePicker(
                                      onChanged: (v){
                                        print("value" + v.dialCode.toString());
                                        setState(() {
                                          countryCode = v.dialCode;
                                        });
                                      },
                                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                      initialSelection: 'IN',
                                      showFlagDialog: true,
                                      comparator: (a, b) => b.name.compareTo(a.name),
                                      //Get the country information relevant to the initial selection
                                      onInit: (code) =>
                                          print("on init ${code.name} ${code.dialCode} ${code.name}"),
                                    ),
                                    width: SizeConfig.blockSizeHorizontal * 30,
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 55,
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(10)
                                      ],
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(
                                            SizeConfig.blockSizeVertical * 1.5),
                                        hintText: "Enter Mobile Number",
                                        hintStyle: GoogleFonts.openSans(
                                          color: Color(fontColorGray),
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeVertical * 1.5,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      controller: mobileController,
                                      keyboardType: TextInputType.phone,
                                      textInputAction: TextInputAction.done,
                                      validator: (s) {
                                        return validateMobile(mobileController.text);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(fontColorGray),
                                    width: 1.0,
                                  )
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 2,
                            ),
                            MaterialButton(
                              onPressed: () {
                                if (loginForm.currentState.validate()) {
                                  loginForm.currentState.save();
                                  Dialogs.showLoadingDialog(
                                      context, loginLoader);
                                  sendOtp
                                      .sendOtp(
                                    context: context,
                                    phone: countryCode + mobileController.text,
                                  )
                                      .then((value) {
                                    print("value.meta.status");
                                    print(value.meta.status);
                                    if (value != null) {
                                      print(value.meta.status);
                                      if (value.meta.status == "200") {
                                        print(value.meta.messageType);
                                        Navigator.of(loginLoader.currentContext,
                                                rootNavigator: true)
                                            .pop();
                                        //toast(value.meta.message);
                                        /*  SharedPreferencesTest().checkIsLogin("0");
                                          SharedPreferencesTest()
                                              .saveToken("set", value: value.token);*/

                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (conext) {
                                          return OTPScreen(
                                            phoneNumber: countryCode + mobileController.text,
                                          );
                                        }));
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
                                }
                              },
                              minWidth: SizeConfig.screenWidth,
                              color: Color(backgroundColorBlue),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              height: SizeConfig.blockSizeVertical * 6,
                              child: Text(
                                "LOGIN",
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "By tapping continue or Login you agree to our",
                        style: GoogleFonts.openSans(
                            color: Color(fontColorGray),
                            fontSize: SizeConfig.blockSizeVertical * 1.5,
                            fontWeight: FontWeight.w400),
                      ),
                      width: SizeConfig.screenWidth,
                      alignment: Alignment.center,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewClass(link:"https://sal-foundation.com/app_pp")));
                      },
                      child: Container(
                        child: Text(
                          "Terms of service & Privacy Policy.",
                          style: GoogleFonts.openSans(
                              color: Color(backgroundColorBlue),
                              fontSize: SizeConfig.blockSizeVertical * 1.5,
                              fontWeight: FontWeight.w400),
                        ),
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
