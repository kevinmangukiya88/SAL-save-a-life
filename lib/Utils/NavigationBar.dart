import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/AppointmentsTabBarView.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'Colors.dart';

class NavigationBar extends StatefulWidget {
  int index;
  NavigationBar({Key key,this.index}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      showUnselectedLabels: true,
      currentIndex: widget.index,
      unselectedItemColor: Color(fontColorGray),
      selectedLabelStyle: GoogleFonts.openSans(
        color: Color(backgroundColorBlue),
      ),
      unselectedLabelStyle: GoogleFonts.openSans(
          color: Color(fontColorGray)
      ),
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          widget.index = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: InkWell(
          onTap: (){
            Navigator.of(context).pushReplacementNamed('/HomeMain');
          },
          child: Container(child:
          Image.asset('assets/icons/nav home.png',
            color: widget.index == 0 ?Colors.white:Color(fontColorGray),
            scale: SizeConfig.blockSizeVertical * 0.4,),
            decoration: BoxDecoration(
                color: widget.index == 0?Color(backgroundColorBlue): Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
        ),
            label: "Home"),
        BottomNavigationBarItem(icon: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return AppointmentTabBarView();}));
          },
          child: Container(child:
          Image.asset('assets/icons/nav booking.png',
            color: widget.index == 1 ?Colors.white:Color(fontColorGray),
            scale: SizeConfig.blockSizeVertical * 0.4,),
            decoration: BoxDecoration(
                color: widget.index == 1 ?Color(backgroundColorBlue): Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
        ),
            label: "Booking"),
        BottomNavigationBarItem(icon: InkWell(
          onTap: (){
            Navigator.of(context).pushReplacementNamed('/ExploreAll');
          },
          child: Container(child:
          Image.asset('assets/icons/nav explore.png',
            scale: SizeConfig.blockSizeVertical * 0.4,
            color: widget.index == 2 ?Colors.white:Color(fontColorGray),
          ),
            decoration: BoxDecoration(
                color: widget.index == 2?Color(backgroundColorBlue): Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
        ),
            label: "Explore",
        ),
        BottomNavigationBarItem(icon: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed('/CafeEvents');
          },
          child: Container(child:
          Image.asset('assets/icons/nav cafe.png',
            scale: SizeConfig.blockSizeVertical * 0.4,
            color: widget.index == 3 ?Colors.white:Color(fontColorGray),
          ),
            decoration: BoxDecoration(
                color: widget.index == 3?Color(backgroundColorBlue): Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
        ),
            label: "Cafe"),
      ],
    );
  }
}
