import 'package:flutter/material.dart';
import 'package:mental_health/UI/upcomingAppointments.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'PastAppointments.dart';



class AppointmentTabBarView extends StatefulWidget {
  const AppointmentTabBarView({Key key}) : super(key: key);

  @override
  _AppointmentTabBarViewState createState() => _AppointmentTabBarViewState();
}

class _AppointmentTabBarViewState extends State<AppointmentTabBarView> with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(backgroundColorBlue),
          bottom: TabBar(
            controller: _controller,
            onTap: (v){
              _selectedIndex = v;
            },
            isScrollable: false,
            tabs: [
              Tab(child: Text("UPCOMING"),),
              Tab(icon: Text("PAST"),),
            ],
          ),
          title: Text('Appointments'),
        ),
        body: TabBarView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            AppointmentsScreen(),
            Cafe2(),
          ],
        ),
      ),
    );
  }
}