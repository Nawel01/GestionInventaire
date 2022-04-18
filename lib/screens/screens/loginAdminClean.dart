import 'package:display/screens/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Services/authAdmin.dart';
import 'clean.dart';


void main(){
  runApp(MaterialApp(
    home: LoginAdminClean(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Poppins'),
  ));
}

class LoginAdminClean extends StatefulWidget {
  const LoginAdminClean({Key? key}) : super(key: key);

  @override
  State<LoginAdminClean> createState() => _LoginAdminCleanState();
}

class _LoginAdminCleanState extends State<LoginAdminClean> {
  var username, password, token;
  TextStyle style = TextStyle(fontFamily: 'Poppins', fontSize: 16.0);
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      onChanged: (val) {
        username = val;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Nom de l'admin",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      onChanged: (val) {
        password = val;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mot de passe",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffC34A36),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          AuthAdmin().login(username, password).then((val) {
            if (val.data['success']) {
              token = val.data['token'];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Clean()),
              );
            }
          });
        },
        child: Text("Se connecter",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,),
                  Text("Se connecter en tant qu'administrateur",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 45.0),
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  SizedBox(
                    height: 35.0,
                  ),
                  loginButon,
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
