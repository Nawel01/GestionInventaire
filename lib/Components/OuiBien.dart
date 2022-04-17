import 'package:flutter/material.dart';

class OuiBien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Vous etes en train de supprimer la liste des biens',
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

    );
    ;
  }
}
