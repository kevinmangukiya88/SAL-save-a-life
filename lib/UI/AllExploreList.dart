import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/videoplayer.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/controller/explore_controller.dart';

import 'Articledetail.dart';
import 'Audioplayer.dart';

class AllExploreList extends StatelessWidget {
  final List<dynamic> dataList;
  final String extension;

  AllExploreList({Key key, this.dataList, this.extension}) : super(key: key);

  ExploreController _exploreController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: GridView.builder(
        itemCount: dataList.length,
        padding: EdgeInsets.symmetric(horizontal: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 1 / 0.9),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  var url = "https://sal-prod.s3.ap-south-1.amazonaws.com/" +
                      "${dataList[index].content}";
                  if (extension == 'Video') {
                    Get.to(ButterFlyAssetVideo(url: url));
                  } else if (extension == 'Audio') {
                    Get.to(PlayerPage(url: url));
                  }
                  Get.to(Article(
                      image: "https://sal-prod.s3.ap-south-1.amazonaws.com/" +
                          dataList[index].photo,
                      title: dataList[index].title,
                      description: dataList[index].description));
                },
                child: Container(
                  width: SizeConfig.screenWidth * 0.45,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://sal-prod.s3.ap-south-1.amazonaws.com/" +
                                dataList[index].photo),
                        fit: BoxFit.fill),
                  ),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.02,
                        right: SizeConfig.screenWidth * 0.02),
                    height: SizeConfig.blockSizeVertical * 8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            dataList[index].title,
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          "3m",
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 5,
                  child: GetBuilder<ExploreController>(
                    builder: (controller) {
                      return IconButton(
                        icon: controller.likedList.contains(dataList[index].id)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                        color: Colors.pinkAccent,
                        onPressed: () {
                          _exploreController.setLikedList(dataList[index].id);
                        },
                      );
                    },
                  )),
            ],
          );
        },
      ),
    );
  }
}
