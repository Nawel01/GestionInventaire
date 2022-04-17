import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffFFB497),
            bottom: const TabBar(
              indicatorColor: Color(0xffC34A36),
              tabs: [
                Tab(child: Text('Affectations',style: TextStyle(fontSize: 20),),),
                Tab(child: Text('Biens',style: TextStyle(fontSize: 20),),),

              ],
            ),

          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),

            ],
          ),
        ),
      ),
    );
  }
}
