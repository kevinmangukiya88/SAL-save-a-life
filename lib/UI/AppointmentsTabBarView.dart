import 'package:flutter/material.dart';
import 'package:mental_health/UI/upcomingAppointments.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/NavigationBar.dart';
import 'PastAppointments.dart';

class AppointmentTabBarView extends StatefulWidget {
  const AppointmentTabBarView({Key key}) : super(key: key);

  @override
  _AppointmentTabBarViewState createState() => _AppointmentTabBarViewState();
}

class _AppointmentTabBarViewState extends State<AppointmentTabBarView>
    with SingleTickerProviderStateMixin {
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
              controller: _controller,
              onTap: (v) {
                _selectedIndex = v;
              },
              isScrollable: false,
              indicatorWeight: 3,
              unselectedLabelColor: Colors.grey,
              labelColor: Color(backgroundColorBlue),
              indicatorColor: Color(backgroundColorBlue),
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w700, fontFamily: 'OpenSans'),
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w700, fontFamily: 'OpenSans'),
              tabs: [
                Tab(
                  child: Text(
                    "UPCOMING",
                  ),
                ),
                Tab(
                  icon: Text("PAST"),
                ),
              ],
            ),
            // title: Text(
            //   'Appointments',
            //   style: TextStyle(color: Color(backgroundColorBlue)),
            // ),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          index: 1,
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
