import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_health/Utils/ActionSheet.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/Dialogs.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/data/repo/UploadImagesRepo.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Price1.dart';

String selectSocialProfile = "";
bool selected = false;
File certificateImage;
File adhaarCardImage;
File resumeImage;
var hint;

String certificateDoc;
String adhaarDoc;
String resumeDoc;
var getImage;
bool adhar = false;
var linkController = TextEditingController();

class Info1 extends StatefulWidget {
  const Info1({Key key}) : super(key: key);

  @override
  _Info1State createState() => _Info1State();
}

class _Info1State extends State<Info1> {
  var formKey = GlobalKey<FormState>();
  var uploadImage = UploadImagesRepo();
  final GlobalKey<State> loginLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: radioValue.toString() == "Listener"
            ? Text(
                "5/7",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey),
                ),
              )
            : Text(
                "6/8",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey),
                ),
              ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   Container(
        //     alignment: Alignment.center,
        //     padding: EdgeInsets.all(SizeConfig.blockSizeVertical),
        //     child: Text(
        //       "Skip",
        //       style: GoogleFonts.openSans(color: Colors.blue),
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            radioValue.toString() != "Listener"
                ? Container(
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                          value: 0.6,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.15,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.05,
                            right: SizeConfig.screenWidth * 0.05,
                          ),
                          child: Text(
                            "Upload your relevant Qualification Certificate",
                            style: GoogleFonts.openSans(
                                fontSize: SizeConfig.blockSizeVertical * 4,
                                fontWeight: FontWeight.bold,
                                color: Color(fontColorSteelGrey)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.05,
                            right: SizeConfig.screenWidth * 0.05,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      ActionSheet().actionSheet(context,
                                          onCamera: () {
                                        FocusScope.of(context).unfocus();
                                        adhaarCameraFile().then((File file) {
                                          if (file != null) {
                                            Dialogs.showLoadingDialog(
                                                context, loginLoader);
                                            uploadImage
                                                .uploadImage(context,
                                                    image: adhaarCardImage)
                                                .then((value) {
                                              if (value != null) {
                                                if (value.meta.status ==
                                                    "200") {
                                                  setState(() {
                                                    adhaarDoc =
                                                        value.file.toString();
                                                  });
                                                  Navigator.of(
                                                          loginLoader
                                                              .currentContext,
                                                          rootNavigator: true)
                                                      .pop();
                                                } else {
                                                  Navigator.of(
                                                          loginLoader
                                                              .currentContext,
                                                          rootNavigator: true)
                                                      .pop();
                                                  showAlertDialog(
                                                    context,
                                                    value.meta.message,
                                                    "",
                                                  );
                                                }
                                              } else {
                                                Navigator.of(
                                                        loginLoader
                                                            .currentContext,
                                                        rootNavigator: true)
                                                    .pop();
                                                showAlertDialog(
                                                  context,
                                                  value.meta.message,
                                                  "",
                                                );
                                              }
                                            }).catchError((error) {
                                              Navigator.of(
                                                      loginLoader
                                                          .currentContext,
                                                      rootNavigator: true)
                                                  .pop();
                                              showAlertDialog(
                                                context,
                                                error.toString(),
                                                "",
                                              );
                                            });
                                            setState(() {
                                              selected = true;
                                              //   loading = true;
                                            });
                                          }
                                        }).catchError((onError) {});
                                      }, onDocument: () async {
                                        await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowCompression: true,
                                          allowedExtensions: [
                                            'pdf',
                                            "doc",
                                            "docx"
                                          ],
                                        ).then((value) {
                                          if (value != null) {
                                            Dialogs.showLoadingDialog(
                                                context, loginLoader);
                                            uploadImage
                                                .uploadImage(context,
                                                    image: adhaarCardImage)
                                                .then((value) {
                                              if (value != null) {
                                                if (value.meta.status ==
                                                    "200") {
                                                  setState(() {
                                                    adhaarDoc =
                                                        value.file.toString();
                                                  });
                                                  Navigator.of(
                                                          loginLoader
                                                              .currentContext,
                                                          rootNavigator: true)
                                                      .pop();
                                                } else {
                                                  Navigator.of(
                                                          loginLoader
                                                              .currentContext,
                                                          rootNavigator: true)
                                                      .pop();
                                                  showAlertDialog(
                                                    context,
                                                    value.meta.message,
                                                    "",
                                                  );
                                                }
                                              } else {
                                                Navigator.of(
                                                        loginLoader
                                                            .currentContext,
                                                        rootNavigator: true)
                                                    .pop();
                                                showAlertDialog(
                                                  context,
                                                  value.meta.message,
                                                  "",
                                                );
                                              }
                                            }).catchError((error) {
                                              Navigator.of(
                                                      loginLoader
                                                          .currentContext,
                                                      rootNavigator: true)
                                                  .pop();
                                              showAlertDialog(
                                                context,
                                                error.toString(),
                                                "",
                                              );
                                            });
                                          }
                                          setState(() {
                                            certificateImage =
                                                File(value.paths.elementAt(0));
                                          });
                                        }).catchError((onError) {});
                                      }, onGallery: () {
                                        FocusScope.of(context).unfocus();
                                        adhaarchooseImageFile().then((value) {
                                          if (value != null) {
                                            Dialogs.showLoadingDialog(
                                                context, loginLoader);
                                            uploadImage
                                                .uploadImage(context,
                                                    image: adhaarCardImage)
                                                .then((value) {
                                              if (value != null) {
                                                if (value.meta.status ==
                                                    "200") {
                                                  setState(() {
                                                    adhaarDoc =
                                                        value.file.toString();
                                                  });
                                                  Navigator.of(
                                                          loginLoader
                                                              .currentContext,
                                                          rootNavigator: true)
                                                      .pop();
                                                } else {
                                                  Navigator.of(
                                                          loginLoader
                                                              .currentContext,
                                                          rootNavigator: true)
                                                      .pop();
                                                  showAlertDialog(
                                                    context,
                                                    value.meta.message,
                                                    "",
                                                  );
                                                }
                                              } else {
                                                Navigator.of(
                                                        loginLoader
                                                            .currentContext,
                                                        rootNavigator: true)
                                                    .pop();
                                                showAlertDialog(
                                                  context,
                                                  value.meta.message,
                                                  "",
                                                );
                                              }
                                            }).catchError((error) {
                                              Navigator.of(
                                                      loginLoader
                                                          .currentContext,
                                                      rootNavigator: true)
                                                  .pop();
                                              showAlertDialog(
                                                context,
                                                error.toString(),
                                                "",
                                              );
                                            });
                                          }
                                          setState(() {
                                            selected = true;
                                            //  loading = true;
                                          });
                                        }).catchError((onError) {});
                                      }, text: "Select document"));
                            },
                            child: certificateImage != null &&
                                    certificateImage.path != null
                                ? Text(
                                    certificateImage.path.split("/").last,
                                    style: GoogleFonts.openSans(
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2),
                                  )
                                : Text(
                                    "UPLOAD ADHAAR CARD(Only Pdf.,Doc,  are allowed)",
                                    style: GoogleFonts.openSans(
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.5),
                                  ),
                            minWidth: SizeConfig.screenWidth,
                            textColor: Colors.blue,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: Colors.blue)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.05,
                            right: SizeConfig.screenWidth * 0.05,
                            top: SizeConfig.blockSizeVertical * 5,
                          ),
                          child: Text(
                            "Share with us your",
                            style: GoogleFonts.openSans(
                                fontSize: SizeConfig.blockSizeVertical * 4,
                                fontWeight: FontWeight.bold,
                                color: Color(fontColorSteelGrey)),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.05,
                            right: SizeConfig.screenWidth * 0.05,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)),
                          child: RadioListTile<String>(
                            dense: true,
                            value: "Resume",
                            groupValue: selectSocialProfile,
                            onChanged: (value) {
                              setState(() {
                                selectSocialProfile = value;
                                hint = "Upload LInk";
                                print(":gdcj" + selectSocialProfile.toString());
                                selected = true;
                              });
                            },
                            title: Text(
                              "RESUME",
                              style: GoogleFonts.openSans(
                                  color: Color(fontColorGray)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.05,
                            right: SizeConfig.screenWidth * 0.05,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)),
                          child: RadioListTile<String>(
                            dense: true,
                            value: "Linked In",
                            groupValue: selectSocialProfile,
                            onChanged: (value) {
                              setState(() {
                                selectSocialProfile = value;
                                hint = "Enter LInk";
                                print("cjsjc" + selectSocialProfile.toString());
                                selected = true;
                              });
                            },
                            title: Text(
                              "LINKEDIN",
                              style: GoogleFonts.openSans(
                                  color: Color(fontColorGray)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        Form(
                          key: formKey,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.05,
                              right: SizeConfig.screenWidth * 0.05,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey)),
                            child: selectSocialProfile == "Linked In"
                                ? TextFormField(
                                    controller: linkController,
                                    validator: (s) {
                                      return validateLink(linkController.text);
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter Link",
                                      hintStyle: GoogleFonts.openSans(
                                          color: Color(fontColorGray)),
                                      contentPadding: EdgeInsets.all(
                                          SizeConfig.blockSizeVertical * 2),
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons.link),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              ActionSheet().actionSheet(context,
                                                  type: "Document",
                                                  onCamera: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                adhaarCameraFile()
                                                    .then((File file) {
                                                  if (file != null) {
                                                    Dialogs.showLoadingDialog(
                                                        context, loginLoader);
                                                    uploadImage
                                                        .uploadImage(context,
                                                            image: resumeImage)
                                                        .then((value) {
                                                      if (value != null) {
                                                        if (value.meta.status ==
                                                            "200") {
                                                          setState(() {
                                                            resumeDoc = value
                                                                .file
                                                                .toString();
                                                          });
                                                          Navigator.of(
                                                                  loginLoader
                                                                      .currentContext,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop();
                                                        } else {
                                                          Navigator.of(
                                                                  loginLoader
                                                                      .currentContext,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop();
                                                          showAlertDialog(
                                                            context,
                                                            value.meta.message,
                                                            "",
                                                          );
                                                        }
                                                      } else {
                                                        Navigator.of(
                                                                loginLoader
                                                                    .currentContext,
                                                                rootNavigator:
                                                                    true)
                                                            .pop();
                                                        showAlertDialog(
                                                          context,
                                                          value.meta.message,
                                                          "",
                                                        );
                                                      }
                                                    }).catchError((error) {
                                                      Navigator.of(
                                                              loginLoader
                                                                  .currentContext,
                                                              rootNavigator:
                                                                  true)
                                                          .pop();
                                                      showAlertDialog(
                                                        context,
                                                        error.toString(),
                                                        "",
                                                      );
                                                    });
                                                    setState(() {
                                                      adhar = true;
                                                      //   loading = true;
                                                    });
                                                  }
                                                }).catchError((onError) {});
                                              }, onDocument: () async {
                                                await FilePicker.platform
                                                    .pickFiles(
                                                  type: FileType.custom,
                                                  allowCompression: true,
                                                  allowedExtensions: [
                                                    'pdf',
                                                    "doc",
                                                    "docx"
                                                  ],
                                                ).then((value) {
                                                  if (value != null) {
                                                    Dialogs.showLoadingDialog(
                                                        context, loginLoader);
                                                    uploadImage
                                                        .uploadImage(context,
                                                            image: resumeImage)
                                                        .then((value) {
                                                      if (value != null) {
                                                        if (value.meta.status ==
                                                            "200") {
                                                          setState(() {
                                                            resumeDoc = value
                                                                .file
                                                                .toString();
                                                          });
                                                          Navigator.of(
                                                                  loginLoader
                                                                      .currentContext,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop();
                                                        } else {
                                                          Navigator.of(
                                                                  loginLoader
                                                                      .currentContext,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop();
                                                          showAlertDialog(
                                                            context,
                                                            value.meta.message,
                                                            "",
                                                          );
                                                        }
                                                      } else {
                                                        Navigator.of(
                                                                loginLoader
                                                                    .currentContext,
                                                                rootNavigator:
                                                                    true)
                                                            .pop();
                                                        showAlertDialog(
                                                          context,
                                                          value.meta.message,
                                                          "",
                                                        );
                                                      }
                                                    }).catchError((error) {
                                                      Navigator.of(
                                                              loginLoader
                                                                  .currentContext,
                                                              rootNavigator:
                                                                  true)
                                                          .pop();
                                                      showAlertDialog(
                                                        context,
                                                        error.toString(),
                                                        "",
                                                      );
                                                    });
                                                  }
                                                  setState(() {
                                                    resumeImage = File(value
                                                        .paths
                                                        .elementAt(0));
                                                    getImage = resumeImage.path
                                                        .split("/");
                                                  });
                                                }).catchError((onError) {});
                                              }, onGallery: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                adhaarchooseImageFile()
                                                    .then((value) {
                                                  if (value != null) {
                                                    Dialogs.showLoadingDialog(
                                                        context, loginLoader);
                                                    uploadImage
                                                        .uploadImage(context,
                                                            image: resumeImage)
                                                        .then((value) {
                                                      if (value != null) {
                                                        if (value.meta.status ==
                                                            "200") {
                                                          setState(() {
                                                            resumeDoc = value
                                                                .file
                                                                .toString();
                                                          });
                                                          Navigator.of(
                                                                  loginLoader
                                                                      .currentContext,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop();
                                                        } else {
                                                          Navigator.of(
                                                                  loginLoader
                                                                      .currentContext,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop();
                                                          showAlertDialog(
                                                            context,
                                                            value.meta.message,
                                                            "",
                                                          );
                                                        }
                                                      } else {
                                                        Navigator.of(
                                                                loginLoader
                                                                    .currentContext,
                                                                rootNavigator:
                                                                    true)
                                                            .pop();
                                                        showAlertDialog(
                                                          context,
                                                          value.meta.message,
                                                          "",
                                                        );
                                                      }
                                                    }).catchError((error) {
                                                      Navigator.of(
                                                              loginLoader
                                                                  .currentContext,
                                                              rootNavigator:
                                                                  true)
                                                          .pop();
                                                      showAlertDialog(
                                                        context,
                                                        error.toString(),
                                                        "",
                                                      );
                                                    });
                                                  }
                                                  setState(() {
                                                    selected = true;
                                                    adhar = true;
                                                    //  loading = true;
                                                  });
                                                }).catchError((onError) {});
                                              }, text: "Select document"));
                                    },
                                    child: AbsorbPointer(
                                      child: TextFormField(
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                          hintText: resumeImage != null &&
                                                  resumeImage != ""
                                              ? getImage[7].toString()
                                              : "Upload Document(pdf,docs are allowed)",
                                          hintStyle: GoogleFonts.openSans(
                                              color: Color(fontColorGray),
                                              fontSize: 10),
                                          contentPadding: EdgeInsets.all(
                                              SizeConfig.blockSizeVertical * 2),
                                          border: InputBorder.none,
                                          suffixIcon: Icon(Icons.link),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
                top: SizeConfig.blockSizeVertical * 5,
              ),
              child: Text(
                "Upload your Adhaar Card",
                style: GoogleFonts.openSans(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    fontWeight: FontWeight.bold,
                    color: Color(fontColorSteelGrey)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: MaterialButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) =>
                          ActionSheet().actionSheet(context, onCamera: () {
                            FocusScope.of(context).unfocus();
                            adhaarCameraFile().then((File file) {
                              if (file != null) {
                                Dialogs.showLoadingDialog(context, loginLoader);
                                uploadImage
                                    .uploadImage(context,
                                        image: adhaarCardImage)
                                    .then((value) {
                                  if (value != null) {
                                    if (value.meta.status == "200") {
                                      setState(() {
                                        adhaarDoc = value.file.toString();
                                      });
                                      Navigator.of(loginLoader.currentContext,
                                              rootNavigator: true)
                                          .pop();
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
                                setState(() {
                                  selected = true;
                                  adhar = true;
                                  //   loading = true;
                                });
                              }
                            }).catchError((onError) {});
                          }, onDocument: () async {
                            await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowCompression: true,
                              allowedExtensions: ['pdf', "doc", "docx"],
                            ).then((value) {
                              if (value != null) {
                                Dialogs.showLoadingDialog(context, loginLoader);
                                uploadImage
                                    .uploadImage(context,
                                        image: adhaarCardImage)
                                    .then((value) {
                                  if (value != null) {
                                    if (value.meta.status == "200") {
                                      setState(() {
                                        adhaarDoc = value.file.toString();
                                      });
                                      Navigator.of(loginLoader.currentContext,
                                              rootNavigator: true)
                                          .pop();
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
                              setState(() {
                                adhaarCardImage =
                                    File(value.paths.elementAt(0));
                                adhar = true;
                                selected = true;
                              });
                            }).catchError((onError) {});
                          }, onGallery: () {
                            FocusScope.of(context).unfocus();
                            adhaarchooseImageFile().then((value) {
                              if (value != null) {
                                Dialogs.showLoadingDialog(context, loginLoader);
                                uploadImage
                                    .uploadImage(context,
                                        image: adhaarCardImage)
                                    .then((value) {
                                  if (value != null) {
                                    if (value.meta.status == "200") {
                                      setState(() {
                                        adhaarDoc = value.file.toString();
                                      });
                                      Navigator.of(loginLoader.currentContext,
                                              rootNavigator: true)
                                          .pop();
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
                              setState(() {
                                selected = true;
                                //  loading = true;
                              });
                            }).catchError((onError) {});
                          }, text: "Select document"));
                },
                child: adhaarCardImage != null && adhaarCardImage.path != null
                    ? Text(
                        adhaarCardImage.path.split("/").last,
                        style: GoogleFonts.openSans(
                            fontSize: SizeConfig.blockSizeVertical * 2),
                      )
                    : Text(
                        "UPLOAD ADHAAR CARD(Only Pdf.,Doc,  are allowed)",
                        style: GoogleFonts.openSans(
                            fontSize: SizeConfig.blockSizeVertical * 1.5),
                      ),
                minWidth: SizeConfig.screenWidth,
                textColor: Colors.blue,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        backgroundColor:
            selected == true && adhar == true ? Colors.blue : Colors.grey,
        onPressed: () {
          if (radioValue.toString() == "Listener") {
            if (adhaarCardImage != null && adhaarCardImage != "") {
              Navigator.of(context).pushNamed('/Info2');
            } else {
              toast("Please upload required docs");
            }
          } else if (formKey.currentState.validate()) {
            if (certificateImage != null &&
                certificateImage != "" &&
                adhaarCardImage != null &&
                adhaarCardImage != "" &&
                selectSocialProfile != null &&
                selectSocialProfile != " ")
              Navigator.of(context).pushNamed('/Info2');
            else
              toast("Please upload required docs");
          }
        },
      ),
    ));
  }

  Future<File> chooseCertificateCamera() async {
    await ImagePicker.pickImage(
      source: ImageSource.camera,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        certificateImage = new File(value.path);
      });
      if (certificateImage.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return certificateImage;
  }

  Future<File> chooseCertificateGallery() async {
    await ImagePicker.pickImage(
      source: ImageSource.gallery,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        certificateImage = new File(value.path);
      });
      if (certificateImage.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return certificateImage;
  }

  Future<File> adhaarCameraFile() async {
    await ImagePicker.pickImage(
      source: ImageSource.camera,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        adhaarCardImage = new File(value.path);
      });
      if (adhaarCardImage.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return adhaarCardImage;
  }

  Future<File> adhaarchooseImageFile() async {
    await ImagePicker.pickImage(
      source: ImageSource.gallery,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        adhaarCardImage = new File(value.path);
      });
      if (adhaarCardImage.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return adhaarCardImage;
  }

  Future<File> uploadResumeCamera() async {
    await ImagePicker.pickImage(
      source: ImageSource.camera,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        resumeImage = new File(value.path);
      });
      if (resumeImage.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return resumeImage;
  }

  Future<File> uploadResumeGallery() async {
    await ImagePicker.pickImage(
      source: ImageSource.gallery,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        resumeImage = new File(value.path);
      });
      if (resumeImage.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return resumeImage;
  }

  String validateLink(String value) {
    String pattern =
        r"(http|ftp|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?";
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter Url';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid Url';
    }
    return null;
  }
}
