import 'package:mental_health/UI/LoginScreen.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall() async {
  if (await canLaunch(mobileController.text)) {
    await launch(mobileController.text);
  } else {
    throw 'Could not launch $mobileController.text';
  }
}