
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/DrawerMenu.dart';
import 'package:mental_health/Utils/NavigationBar.dart';
import 'package:mental_health/Utils/SharedPref.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/data/repo/ExploreAllrepo.dart';
import 'package:mental_health/data/repo/getHomeContentRepo.dart';
import 'package:mental_health/models/GetHomeContentModal.dart';
import 'package:mental_health/models/Exploreallmodle.dart';
import 'package:mental_health/UI/videoplayer.dart';
import 'package:mental_health/UI/Audioplayer.dart';
import 'package:mental_health/UI/Articledetail.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ExploreAll extends StatefulWidget {
  const ExploreAll({Key key}) : super(key: key);

  @override
  _ExploreAllState createState() => _ExploreAllState();
}

class _ExploreAllState extends State<ExploreAll> {
  AudioPlayer audioPlugin = AudioPlayer();

  List<String> categories = ['All','Liked','Anxiety','Sleep','Anger'];

  List<String> images = ['assets/bg/gridCard1.png',
    'assets/bg/gridCard2.png',
    'assets/bg/gridCard1.png',
    'assets/bg/gridCard4.png','assets/bg/gridCard4.png','assets/bg/gridCard4.png'];

  List<String> imagesVideos = ['https://wallpaperaccess.com/full/170249.jpg',
  'https://wallpapercave.com/wp/wp2005597.jpg',
  'https://wallpaperaccess.com/full/16082.jpg',
  'https://wallpaperaccess.com/full/170249.jpg',
  'https://wallpapercave.com/wp/wp2005597.jpg'];
  var getHomeContent = Explorerepo();
  var getHomeContentModal = ExploreallModel();
  List<String> imagesArticles = ['https://cdn.wallpapersafari.com/63/25/ME53bd.jpg',
  'https://i.pinimg.com/originals/fd/79/fd/fd79fd5d1d23c08762112a4bb8618cee.jpg',
  'https://wallpaperaccess.com/full/1687326.jpg',
  'https://c4.wallpaperflare.com/wallpaper/716/258/567/golden-sky-landscape-wallpapers-path-rocky-mountains-forest-banff-national-park-alberta-canadian-1920%C3%971200-wallpaper-preview.jpg',
  'https://wallpaperbat.com/img/448570-pink-mountains-wallpaper-top-free-pink-mountains-background.jpg'];

  List<Color> colors = [Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(48, 37, 33, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75)];
bool pressAttention=false;
  List<String> desc = ["How to have a\npeaceful mind",
    "Worlds of the\nwaterfall",
    "How to have a\npeaceful mind",
    "Worlds of the\nwaterfall","Worlds of the\nwaterfall","Worlds of the\nwaterfall"];
var therapistId;
  int selectedIndex = 0;
List audio=[];
List video=[];
List article=[];
  // AudioCache audioCache = AudioCache();
  // AudioPlayer advancedPlayer = AudioPlayer();
  onSelected(int index){
    setState(() {
      selectedIndex = index;
    });
  }
bool isloding=false;
  @override
  void initState(){
  getTherapistId();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      drawer: DrawerMenu(),
      bottomNavigationBar: NavigationBar(index: 2,),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 5,
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 2,
                horizontal: SizeConfig.screenWidth * 0.02
              ),
              child: ListView.builder(
                  itemBuilder: (BuildContext context,int index){
                    return InkWell(
                      onTap: (){
                        onSelected(index);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: SizeConfig.blockSizeVertical * 4,
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 4,
                          vertical: SizeConfig.blockSizeVertical
                        ),
                        decoration: BoxDecoration(
                        color: selectedIndex != null && selectedIndex == index ? Colors.blue : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)
                        ),
                        margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 3,
                        left: SizeConfig.blockSizeHorizontal),
                        child: Text(categories[index],
                        style: GoogleFonts.openSans(
                          color: selectedIndex != null && selectedIndex == index ? Colors.white : Color(fontColorSteelGrey)
                        ),),
                      ),
                    );
                  },
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
                primary: false,
              scrollDirection: Axis.horizontal,
                itemCount: categories.length,
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 1.5,
                horizontal: SizeConfig.screenWidth * 0.05
              ),
              child: Text("POPULAR VIDEOS",style: GoogleFonts.openSans(
                color: Color(fontColorGray),
                fontWeight: FontWeight.w600,
              ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02,
                  vertical: SizeConfig.blockSizeVertical
            ),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getAuidos(),
            )),
            Container(
              width: SizeConfig.screenWidth,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 1.5,
                  horizontal: SizeConfig.screenWidth * 0.05
              ),
              child: Text("POPULAR AUDIOS",style: GoogleFonts.openSans(
                color: Color(fontColorGray),
                fontWeight: FontWeight.w600,
              ),),
            ),
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.02,
                    vertical: SizeConfig.blockSizeVertical
                ),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: getvideo(),
                )),
            Container(
              width: SizeConfig.screenWidth,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 1.5,
                  horizontal: SizeConfig.screenWidth * 0.05
              ),
              child: Text("POPULAR ARTICLES",style: GoogleFonts.openSans(
                color: Color(fontColorGray),
                fontWeight: FontWeight.w600,
              ),),
            ),
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.02,
                    vertical: SizeConfig.blockSizeVertical
                ),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: getArticle(),
                )),

          ],
        ),
      ),
    ));
  }
  getTherapistId() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();

    print("sdvvs"+prefs.getString("therapistid"));
    setState(() {
      therapistId=prefs.getString("therapistid");
    });
    getHomeContent.avialabilityRepo(
        context: context,therapistId: therapistId
    )
        .then((value) {

      if (value != null) {
        print(value.meta.status);
        if (value.meta.status == "200") {
          setState(() {
            isloding = false;
            getHomeContentModal = value;
            for(int i=0;i<getHomeContentModal.training.length;i++){
              print(getHomeContentModal.training[i].type);
              if(getHomeContentModal.training[i].type=="1"){
                print("audio");
                audio.add(getHomeContentModal.training[i]);
                print(audio);
              }else if(getHomeContentModal.training[i].type=="2"){
                video.add(getHomeContentModal.training[i]);
                print(video);
              }
              else{
                article.add(getHomeContentModal.training[i]);
              }
            }
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
        print(value.meta.status);
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



  List<Widget> getAuidos() {
    List<Widget> productList = new List();

    for (int i = 0; i < audio.length; i++) {
      productList.add(GestureDetector(onTap: () {
        var url="https://sal-prod.s3.ap-south-1.amazonaws.com/"+"${audio[i].content}";
        print(url);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ButterFlyAssetVideo(url:url)));
       // audioPlugin.play("https://sal-prod.s3.ap-south-1.amazonaws.com/");
       // advancedPlayer.setUrl("https://sal-prod.s3.ap-south-1.amazonaws.com/+${audio[i].content}");
       // advancedPlayer.play("https://sal-prod.s3.ap-south-1.amazonaws.com/+${audio[i].content}");
        //   name:dishfromserver[i]['name'],
        //   chefname: dishfromserver[i]["chef_name"]['full_name'].toString(),
        //   price: dishfromserver[i]['price'],
        //   image: dishfromserver[i]['image'],
        //   time:dishfromserver[i]['time_taken'],
        // ) ));
      },
          child: Stack(
            children: [

              Container(
                width: SizeConfig.screenWidth * 0.45,
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.02
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage("https://sal-prod.s3.ap-south-1.amazonaws.com/"+audio[i].photo),
                      fit: BoxFit.fitWidth
                  ),
                ),
                child: Container(
                  width: SizeConfig.screenWidth,
                  padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.02,
                      right: SizeConfig.screenWidth * 0.02
                  ),
                  height: SizeConfig.blockSizeVertical * 8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:colors[i],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(audio[i].title,
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),),
                      Text("3m",
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                        ),),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 10,right: 10,
                  child: Icon(Icons.favorite_border)),
            ],
          )));
    }
    return productList;
  }
  List<Widget> getvideo() {
    List<Widget> productList = new List();

    for (int i = 0; i < video.length; i++) {
      productList.add(GestureDetector(onTap: () {

        var url="https://sal-prod.s3.ap-south-1.amazonaws.com/"+"${video[i].content}";
        print(url);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerPage(url:url)));

        //   name:dishfromserver[i]['name'],
        //   chefname: dishfromserver[i]["chef_name"]['full_name'].toString(),
        //   price: dishfromserver[i]['price'],
        //   image: dishfromserver[i]['image'],
        //   time:dishfromserver[i]['time_taken'],
        // ) ));
      },
          child: Stack(
            children: [

              Container(
                width: SizeConfig.screenWidth * 0.45,
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.02
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage("https://sal-prod.s3.ap-south-1.amazonaws.com/"+video[i].photo),
                      fit: BoxFit.fitWidth
                  ),
                ),
                child: Container(
                  width: SizeConfig.screenWidth,
                  padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.02,
                      right: SizeConfig.screenWidth * 0.02
                  ),
                  height: SizeConfig.blockSizeVertical * 8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:colors[i],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(video[i].title,
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),),
                      Text("3m",
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                        ),),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 10,right: 5,
                  child: IconButton(  icon: pressAttention ?  Icon(Icons.favorite): Icon(Icons.favorite_border),

        color:Colors.pinkAccent,  onPressed: () => {
              setState(() => pressAttention = !pressAttention),
             // likeapihit()
              },)),
            ],
          )));
    }
    return productList;
  }
  List<Widget> getArticle() {
    List<Widget> productList = new List();

    for (int i = 0; i < article.length; i++) {
      productList.add(GestureDetector(onTap: () {

print(article[i].content);
Navigator.push(context,MaterialPageRoute(builder: (context)=>Article(image:"https://sal-prod.s3.ap-south-1.amazonaws.com/"+article[i].photo,
title:article[i].title,description:article[i].description)));
        //   name:dishfromserver[i]['name'],
        //   chefname: dishfromserver[i]["chef_name"]['full_name'].toString(),
        //   price: dishfromserver[i]['price'],
        //   image: dishfromserver[i]['image'],
        //   time:dishfromserver[i]['time_taken'],
        // ) ));
      },
          child: Container(
            width: SizeConfig.screenWidth * 0.45,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.02
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage("https://sal-prod.s3.ap-south-1.amazonaws.com/"+article[i].photo),
                  fit: BoxFit.fitWidth
              ),
            ),
            child: Container(
              width: SizeConfig.screenWidth,
              padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.02,
                  right: SizeConfig.screenWidth * 0.02
              ),
              height: SizeConfig.blockSizeVertical * 8,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color:colors[i],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(article[i].title,
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),),
                  Text("3m",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                    ),),
                ],
              ),
            ),
          )));
    }
    return productList;
  }
}
