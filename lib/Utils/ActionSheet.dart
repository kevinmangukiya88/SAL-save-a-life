import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/constant/AppColor.dart';
import 'package:nb_utils/nb_utils.dart';

var getBusinessValue;

class ActionSheet {
  Widget actionSheet(
      BuildContext context, {
        Function onCamera,
        Function onGallery,
        Function onDocument,
        String type,
        String text
      }) {
    return CupertinoActionSheet(
      title: Text(
        text,
        style: secondaryTextStyle(),
      ),
      actions: [

        type != "profile" ?  CupertinoActionSheetAction(
          onPressed: () {
            onDocument();
            finish(context);
          },
          child: Text('Documents', style: primaryTextStyle(size: 18)),
          isDefaultAction: true,
        ) :  Column(
          children: [
            CupertinoActionSheetAction(
              onPressed: () {
                onCamera();
                finish(context);
              },
              child: Text('Camera', style: primaryTextStyle(size: 18)),

              isDefaultAction: true,

            ),
            CupertinoActionSheetAction(
              onPressed: () {
                onGallery();
                finish(context);
              },
              child: Text('Gallery', style: primaryTextStyle(size: 18)),
              isDefaultAction: true,
            )
          ],
        )],


      cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            finish(context);
          },
          child: Text(
            'Cancel',
            style: primaryTextStyle(color: colorPrimary, size: 18),
          )),
    );
  }
}

