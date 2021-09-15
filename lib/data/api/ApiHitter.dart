import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:async/async.dart';
import 'package:mental_health/Utils/AlertDialog.dart';

import 'ApiEndPoint.dart';

class ApiHitter {
  static Dio _dio;
// final repo = LogoutRepo();
  final GlobalKey key = new GlobalKey();
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  static Dio getDio() {
    if (_dio == null) {
      BaseOptions options = new BaseOptions(
          baseUrl: ApiEndpoint.BaseUrl,
          connectTimeout: 300000,
          receiveTimeout: 300000);
      return new Dio(options)
        ..interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options)
        {
          print(options.data);
          return options;
        }, onResponse: (Response response) {
          return response; // continue
        }, onError: (DioError e) {
          return e;
        }));
    } else {
      return _dio;
    }
  }
  Future<ApiResponse> getApiResponse(
      String endPoint,
      ) async
  {
    try
    {
      Response response = await getDio().get(endPoint);
      return ApiResponse(true, response: response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ApiResponse(false, msg: "$error");
    }
  }

  Future<ApiResponse> getPostApiResponse(String endPoint,
      {BuildContext context,
        Map<String, dynamic> headers,
        Map<String, dynamic> data,
        FormData formdata,
        bool isformdata = false}) async {

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
      {
        try
        {
          var response = await getDio().post(endPoint,
              options: Options(headers: headers),
              data: isformdata ? formdata : data,
              onSendProgress: (int sent, int total) {});
          String b = "401";
          String a = response.data['status'].toString();
          String message = "Token is not valid";
          String errorMessage = response.data['errors'].toString();
          print("errorMessage" + response.statusMessage.toString());
          if (a == b) {
            this._memoizer.runOnce(() async {
              await Future.delayed(Duration(milliseconds: 750), () {
                showAlertDialog(context, "Your Session is expired.Please Login again", "Token");
/*              showDialog(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                      contentPadding: EdgeInsets.zero,
                      content: Container(
                        height: 200,
                        width: 50,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: <
                                Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0)),
                            child: Container(
                              height: 60,
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 2, bottom: 4.0),
                              color: appColorPrimary,
                              child: Center(
                                  child: Image.asset(
                                      "assets/images/popup_info.png",
                                      height: 30,
                                      width: 30)),
                            ),
                          ),
                          Container(
                              height: 70,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Text(
                                      "Your Session is expired.Please Login again",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ],
                              )),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  margin: EdgeInsets.only(top: 10),
                                  child: Material(
                                    color: appColorPrimary,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        const Radius.circular(8.0),
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        try {
                                          final result =
                                              await InternetAddress.lookup(
                                                  'google.com');
                                          if (result.isNotEmpty &&
                                              result[0].rawAddress.isNotEmpty) {
                                            SharedPreferencesTest()
                                                .checkIsLogin("2");
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DTSignInScreen()),
                                                    (Route<dynamic> route) =>
                                                        false);
                                          }
                                        } on SocketException catch (_) {
                                          Fluttertoast.showToast(
                                              msg: "No Internet Connection",
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 80,
                                        padding: EdgeInsets.only(top: 13),
                                        child: Text(
                                          "LOGOUT",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ]),
                      ),
                    );
                  });*/
              });
            });
          }
          return ApiResponse(
              true, response: response, msg: response.data["msg"]);
        } catch (error, stacktrace) {
          try {
            return ApiResponse(false,
                msg:
                "${error?.response?.data["msg"] ??
                    "Sorry Something went wrong."}");
          } catch (e) {
            print("222");
            return ApiResponse(false, msg: error?.response?.data["msg"]);
          }
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: "No Internet Connection",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

class ApiResponse {
  final bool status;
  final String msg;
  final Response response;

  ApiResponse(this.status, {this.msg = "Success", this.response});
}
