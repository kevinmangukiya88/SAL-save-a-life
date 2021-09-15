import 'package:flutter/material.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class avialll extends StatefulWidget{
  avialll({
    this.subtitle,
    this.time,
    this.switche,
    this.id,
    this.onChange
  })
  ;
  String time;
  var id;
  String subtitle;
  bool switche;
  Function onChange;
  @override
  _avialllState createState() => _avialllState();
}

class _avialllState extends State<avialll> {
  bool switchOrignal = false;
  getValue(){
    setState(() {
      switchOrignal = widget.switche;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
          width: SizeConfig.screenWidth,
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.02,
              vertical: SizeConfig.blockSizeVertical),
          child: ListTile(
              onLongPress: () {
                setState(() {
                  // selected[index] = true;
                 // showDelete = true;
                });
              },
              onTap: () {
                setState(() {
                  // selected[index] = false;
                 // showDelete = false;
                });
              },
              tileColor:
               widget.switche == true ? Colors.white : Color(0XFFF8F8F8),
              title: Text(
              widget.time,
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(widget.subtitle),
              dense: true,
              trailing: Switch(
                value: switchOrignal,
                onChanged: widget.onChange,

                activeColor: Color(backgroundColorBlue),
                inactiveThumbColor: Color(fontColorGray),
                activeTrackColor: Color(0XFFDBE6F5),
                inactiveTrackColor: Color(0XFFD8DFE9),
              )));
   
  }
}