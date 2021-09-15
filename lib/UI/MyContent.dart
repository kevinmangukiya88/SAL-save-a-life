import 'package:audioplayer/audioplayer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/Utils/TimeAgoWidget.dart';
import 'package:mental_health/constant/AppColor.dart';
import 'package:mental_health/data/repo/GetTherapistContentRepo.dart';
import 'package:mental_health/models/GetTherapistContentModal.dart';

class MyContent extends StatefulWidget {
  const MyContent({Key key}) : super(key: key);

  @override
  _MyContentState createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
var getContent  = GetTherapistContentRepo();
var contentModal = GetTherapistContentModal();
bool isloading = false;


List<Color> colors = [
  Color.fromRGBO(42, 138, 163, 0.75),
  Color.fromRGBO(48, 37, 33, 0.75),
  Color.fromRGBO(42, 138, 163, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
  Color.fromRGBO(42, 138, 163, 0.75),
  Color.fromRGBO(48, 37, 33, 0.75),
  Color.fromRGBO(42, 138, 163, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
  Color.fromRGBO(42, 138, 163, 0.75),
  Color.fromRGBO(48, 37, 33, 0.75),
  Color.fromRGBO(42, 138, 163, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
  Color.fromRGBO(42, 138, 163, 0.75),
  Color.fromRGBO(48, 37, 33, 0.75),
  Color.fromRGBO(42, 138, 163, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
  Color.fromRGBO(0, 90, 100, 0.75),
];

AudioPlayer audioPlugin = AudioPlayer();


  @override
  void initState() {
    super.initState();
    audioPlugin.pause();
    isloading = true;

    getContent
        .getContent(
      context: context,
    )
        .then((value) {
      if (value != null) {
        if (value.meta.status == "200") {
          setState(() {
            isloading = false;
            contentModal = value;
            print(value.mediaUrl);
          });
        } else {
          setState(() {
            isloading = false;

          });
          showAlertDialog(
            context,
            value.meta.message,
            "",
          );
        }
      } else {
        setState(() {
          isloading = false;

        });
        showAlertDialog(
          context,
          value.meta.message,
          "",
        );
      }
    }).catchError((error) {
      setState(() {
        isloading = false;
      });
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
    var child = SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02,
                  vertical: SizeConfig.blockSizeVertical * 2),
              child: contentModal != null &&
                  contentModal.training != null &&
                  contentModal.training.length > 0
                  ? GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemBuilder: (BuildContext context, int index) {
                  /* if(colors.length < getHomeContentModal.articles.length){
                                    colors.addAll(colors);
                                  }*/
                  return Container(
                    width: SizeConfig.screenWidth * 0.4,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: contentModal != null &&
                            contentModal
                                .training.length >
                                0 &&
                            contentModal.training
                                .elementAt(index)
                                .photo !=
                                null &&
                            contentModal.training
                                .elementAt(index)
                                .photo !=
                                ""
                            ? CachedNetworkImageProvider(
                            "https://sal-prod.s3.ap-south-1.amazonaws.com/" +
                                contentModal.training
                                    .elementAt(index)
                                    .photo)
                            : AssetImage(
                          "assets/bg/gridCard1.png",
                        ),
                      ),
                    ),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.02,
                          right: SizeConfig.screenWidth * 0.02),
                      height: SizeConfig.blockSizeVertical * 8,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            contentModal != null &&
                                contentModal
                                    .training.length >
                                    0
                                ? contentModal.training
                                .elementAt(index)
                                .title
                                : "",
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w600, fontSize: SizeConfig.blockSizeVertical  * 1.75),
                          ),
                          Text(
                            timeAgo(DateTime.parse(
                                contentModal.training
                                    .elementAt(index)
                                    .createdAt)),
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: SizeConfig
                                    .blockSizeVertical *
                                    1.50),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: contentModal.training !=
                    null &&
                    contentModal.training.length > 0
                    ? contentModal.training.length
                    : 0,
              )
                  : Container(
                child: Center(child: Text("No content found")),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("My Content",
        style: GoogleFonts.openSans(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),onTap: (){
          Navigator.pop(context);
        },),
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
