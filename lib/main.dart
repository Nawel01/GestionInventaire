import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Components/customShape.dart';
import 'Components/griddashboard.dart';
import 'Components/customShape.dart';
import 'Components/griddashboard.dart';
import 'dbHelper/mongodb.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  //await MongoDatabase.NbrBiens();
  runApp(MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Poppins'),
  ));
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    children: [
                      IconButton(
                        alignment: Alignment.topCenter,
                        icon: Image.asset(
                          "assets/home.png",
                          width: 24,
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        "Accueil",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff56423D),
                            fontSize: 16,

                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),



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
                        icon: Image.asset(
                          "assets/exit.png",
                          width: 24,
                        ),
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

      ),
      backgroundColor: Color(0xffFFF7F3).withOpacity(1),
      body: Column(
        children: <Widget>[


          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
