import 'package:display/models/MongoDbModel.dart';
import 'package:display/dbHelper/mongodb.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

import '../models/MongoDbModel.dart';

class MongoDbInsert extends StatefulWidget {
  const MongoDbInsert({Key? key}) : super(key: key);

  @override
  State<MongoDbInsert> createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {
  var titleController= TextEditingController();
  var descriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text("Insert Data",style: TextStyle(fontSize: 20),),
              SizedBox(height: 50,),
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Task Title"),

              ),
              SizedBox(height: 30,),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Task Description"),

              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                  OutlinedButton(
                  onPressed: (){ _fakeData();},
                  child: Text('generate data'),),
                 ElevatedButton(
                   onPressed: (){

                   },
                   child: Text('insert data'),),

               ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _insertData(String libelle, List<String> biens) async{
      var _id= M.ObjectId();
      final data= MongoDbModel(id: _id, libelle: libelle, biens: biens);
      var result=await MongoDatabase.insert(data);
      if(result.isNotEmpty){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Inserted id : ${_id.$oid}')));
        _clearAll();
      }

  }
  void _clearAll(){
    titleController.text="";
    descriptionController.text="";
  }

  void _fakeData(){
    setState(() {
      titleController.text=faker.lorem.word();
      descriptionController.text=faker.lorem.sentence();
    });
  }
}
