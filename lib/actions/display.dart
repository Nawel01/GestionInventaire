import 'package:display/models/MongoDbModel.dart';
import 'package:display/dbHelper/mongodb.dart';
import 'package:flutter/material.dart';

class MongoDbDisplay extends StatefulWidget {
  const MongoDbDisplay({Key? key}) : super(key: key);

  @override
  State<MongoDbDisplay> createState() => _MongoDbDisplayState();
}

class _MongoDbDisplayState extends State<MongoDbDisplay> {
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(data.libelle),
            SizedBox(height: 5,),
            Column(
              children: [
                ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder:(context,index){
                    return Text(data.biens[index]);
                  } ,
                )
              ],
            )


          ],
        ),
      ),
    );
  }
}
