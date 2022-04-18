import 'dart:developer';

import 'package:display/models/ModelBiens.dart';
import 'package:display/models/MongoDbModel.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter/material.dart';

import 'constant.dart';
import 'mongodb.dart';

class MongoDatabaseBiens{

  static var db,biens;
  static connect() async{
    db= await Db.create(MONGO_DB_URL);
    await db.open();
    inspect(db);
    biens=db.collection("biens");
  }

  static Future<List<Map<String,dynamic>>> getData() async{
    final arrData= await MongoDatabase.biens.find().toList();
    return arrData;

  }

  static Future<String> insert(BienModel data) async{
    try{
      var result =await biens.insertOne(data.toJson());
      if(result.isSuccess){
        return "Data inserted";
      }
      else{
        return "Something wrong";
      }
    } catch (e){
      print(e.toString());
      return e.toString();
    }
  }

}