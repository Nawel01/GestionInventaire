import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_inventaire/Screens/scan.dart';
import 'package:gestion_inventaire/Screens/settings.dart';
import '../Services/authEquipe.dart';

void main(){
  runApp(MaterialApp(
    home: LoginEquipe(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Poppins'),
  ));
}

class LoginEquipe extends StatefulWidget {
  const LoginEquipe({Key? key}) : super(key: key);

  @override
  State<LoginEquipe> createState() => _LoginEquipeState();
}

class _LoginEquipeState extends State<LoginEquipe> {
  var numero, password, token;
  TextStyle style = TextStyle(fontFamily: 'Poppins', fontSize: 16.0);
  @override
  Widget build(BuildContext context) {

    final NumEquipeField = TextField(
      obscureText: false,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ], // Only numbers can be entere
      style: style,
      onChanged: (val) {
        numero = val;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Numero de l'équipe",
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
          AuthEquipe().login(numero, password).then((val) {
            if (val.data['success']) {
              token = val.data['token'];
             /* Fluttertoast.showToast(
                msg: 'Authenticated team : '+numero,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0,);*/
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scan()),
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
                  Text("Se connecter en tant qu'une equipe ",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 45.0),
                  NumEquipeField,
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
