import 'package:flutter/material.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child :Text('Scan',style: TextStyle(fontSize: 40),),
      ),
    );
  }
}
