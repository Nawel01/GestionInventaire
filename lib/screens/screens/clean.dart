import 'package:flutter/material.dart';
import '../../components/customShape.dart';
import '../../components/gridClean.dart';


class Clean extends StatefulWidget {
  @override
  _CleanState createState() => _CleanState();
}

class _CleanState extends State<Clean> {
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
            color: const Color(0xffFFB497),
            child:   const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),

            ),
          ),
        ),

      ),
      body: Container(
        child :Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nettoyage de la base",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xffC34A36),
                  fontSize: 24,

                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40,
            ),
            GridClean(),
          ],
        )
      ),
    );
  }
}
