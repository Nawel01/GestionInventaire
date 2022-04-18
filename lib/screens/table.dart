import 'package:display/models/MongoDbModel.dart';
import 'package:display/dbHelper/mongodb.dart';
import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  
  bool widgetVisible = false ;

  void showWidget(){
    setState(() {
      widgetVisible = true ;
    });
  }

  void hideWidget(){
    setState(() {
      widgetVisible = false ;
    });
  }

  Widget _biens(MongoDbModel data){

    return  Visibility(
      maintainSize: false,
      maintainAnimation: true,
      maintainState: true,
      visible: widgetVisible,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: data.biens.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder:(context,index){
                return Text(data.biens[index]);
              } ,
            )
          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
                future: MongoDatabase.getData(),
                builder: (context,AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else{
                    if(snapshot.hasData){
                      var totalData =snapshot.data.length;
                      print('total data'+totalData.toString());
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context,index){
                            return displayCard(MongoDbModel.fromJson(snapshot.data[index]));
                          }
                      );
                    }else{
                      return Center(
                        child: Text('No data available'),
                      );
                    }
                  }
                }),
          )

      ),
    );
  }
  Widget displayCard(MongoDbModel data){
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                    //  print('pressed ${data.id}');
                      showWidget();
                    },
                      icon: Icon(Icons.add),
                    ),
                    Text(data.libelle),
                    IconButton(onPressed: (){
                       print('pressed ${data.id}');
                      hideWidget();
                    }, icon: Icon(Icons.minimize),
                    ),
                  ]
                ),
                _biens(data),
              ],
            ),
          ),
        ),


      ],
    );
  }
}




