
import 'package:flutter/material.dart';
import 'package:gestion_inventaire/Screens/loginAdmin.dart';
import 'package:gestion_inventaire/Screens/loginEquipe.dart';
import 'package:gestion_inventaire/Screens/scan.dart';
import 'package:gestion_inventaire/Screens/settings.dart';

import '../Screens/clean.dart';
import '../Screens/info.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "lancer le scan",
      img: "assets/scan.png",
      goTo: ""
  );

  Items item2 = new Items(
    title: "Nettoyage de la base",
    img: "assets/clean.png",
      goTo: ""
  );
  Items item3 = new Items(
    title: "Paramètres",
    img: "assets/settings.png",
      goTo: ""
  );

  Items item6 = new Items(
    title: "A propos !",
    img: "assets/info.png",
      goTo: ""
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item6];
    var color = 0xffBEA6A0;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color).withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 42,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                              color: Color(0xff56423D),
                              fontSize: 18,

                              fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),


                  ],
                ),
              ),
              onTap: () {
               if(data.title=="lancer le scan"){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => LoginEquipe(),
                     )
                 );
               }
               if(data.title=="Nettoyage de la base"){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => Clean(),
                     )
                 );
               }
               if(data.title=="Paramètres"){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => LoginAdmin(),
                     )
                 );
               }
               if(data.title=="A propos !"){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => Info(),
                     )
                 );
               }
              },
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  String goTo;
  Items({required this.title, required this.img, required this.goTo});
}
