import 'package:display/dbHelper/mongodb.dart';
import 'package:display/actions/display.dart';
import 'package:display/actions/insert.dart';
import 'package:display/screens/displayAffectations.dart';
import 'package:display/screens/displayBiens.dart';
import 'package:display/screens/table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/customShape.dart';

class Parametres extends StatefulWidget {
  @override
  _ParametresState createState() => _ParametresState();
}

class _ParametresState extends State<Parametres> {
  int index = 0;


  @override
  Widget build(BuildContext context) => Scaffold(
    bottomNavigationBar: buildBottomBar(),
    body: buildPages(),
  );

  Widget buildBottomBar() {
    final style = const TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor:Color(0xffC34A36),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      selectedFontSize: 20,
      unselectedFontSize: 18,
      currentIndex: index,
      items: const [

        BottomNavigationBarItem(
          label:'Affectations',
          icon: Visibility(
              maintainSize: false,
              //maintainState: true,
              visible: false,
              child: Text("")),

        ),
        BottomNavigationBarItem(
            icon: Visibility(
                maintainSize: false,
                //maintainState: true,
                visible: false,
                child: Text("")),

            label:'Biens'
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {

      case 0:
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 130,
            elevation: 0.0,
            flexibleSpace: ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffFFB497),
                child:   Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Image.asset("assets/logo.png",width: 120,),


                      Row(
                        children: [
                          Text(
                            "Quitter",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff56423D),
                                fontSize: 16,

                                fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                            alignment: Alignment.topCenter,
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

          ),
          body: DisplayAffectations(),
        );
    //  return BasicTilePage();
      case 1:
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 130,
            elevation: 0.0,
            flexibleSpace: ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffFFB497),
                child:   Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                          Image.asset("assets/logo.png",width: 120,),

                      Row(
                        children: [
                          Text(
                            "Quitter",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff56423D),
                                fontSize: 16,

                                fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                            alignment: Alignment.topCenter,
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {SystemNavigator.pop();},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

          ),
          body: DisplayBiens(),
        );

      default:
        return Container();
    }
  }
}
