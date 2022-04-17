
import 'package:flutter/material.dart';
import 'package:gestion_inventaire/Screens/scan.dart';
import 'package:gestion_inventaire/Screens/settings.dart';

import '../Screens/clean.dart';
import '../Screens/info.dart';

class GridClean extends StatelessWidget {
  Items item1 = Items(
      title: "Supprimer la liste des biens",
      img: "assets/clean.png",

  );

  Items item2 = Items(
      title: "Supprimer la liste d'inventaire",
      img: "assets/clean.png",

  );


  @override
  Widget build(BuildContext context) {
    Widget OuiBien(){
      return   AlertDialog(
          content: const Text('Vous etes en train de supprimer la liste des biens',
              style: TextStyle(
                fontSize: 22,)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, MaterialPageRoute(builder: (context) => OuiBien())),
              child: const Text('Non', style: TextStyle(fontSize: 20,color: Color(0xffC34A36))),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Oui', style: TextStyle(fontSize: 20,color: Color(0xffC34A36))),
            ),
          ],

        );

    }
    Future <String?> OuiInventaire(){
      return  showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: const Text("Vous etes en train de supprimer la liste d'inventaire",
              style: TextStyle(
                fontSize: 22,)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Non', style: TextStyle(fontSize: 20,color: Color(0xffC34A36))),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Oui', style: TextStyle(fontSize: 20,color: Color(0xffC34A36))),
            ),
          ],

        ),
      );
    }
    List<Items> myList = [item1, item2];
    var color = 0xffBEA6A0;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: const EdgeInsets.only(left: 90, right: 90),
          crossAxisCount: 1,
          mainAxisSpacing: 20,
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
                      width: 55,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff56423D),
                          fontSize: 22,

                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),


                  ],
                ),
              ),
              onTap: () {
                if(data==item1){
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: const Text('Voulez vous vraiment supprimer la liste des biens ?',
                        style: TextStyle(
                          fontSize: 22,)),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Non', style: TextStyle(fontSize: 20,color: Color(0xffC34A36))),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context,  OuiBien()),
                          child: const Text('Oui', style: TextStyle(fontSize: 20,color: Color(0xffC34A36))),
                        ),
                      ],

                    ),
                  );
                }
                if(data==item2){
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: const Text("Voulez vous vraiment supprimer la liste d'inventaire ?",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Non', style: TextStyle(fontSize: 20,color: Color(0xffC34A36)),),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('Oui',style: TextStyle(fontSize: 20,color: Color(0xffC34A36)),),
                        ),
                      ],

                    ),
                  );
                }

              },
            );
          }).toList()),
    );
  }
}
// ignore: non_constant_identifier_names


class Items {
  String title;
  String img;
  Items({required this.title, required this.img});
}
