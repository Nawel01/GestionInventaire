import 'dart:developer';

import 'package:display/models/ModelBiens.dart';
import 'package:display/models/MongoDbModel.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class MongoDatabase{
  static var db,affectations,biens,nbrBiens;
  static connect() async{
    db= await Db.create(MONGO_DB_URL);
    await db.open();
    inspect(db);
    affectations=db.collection(TASK_COLLECTION);
    biens=db.collection(BIEN_COLLECTION);
    //nbrBiens=count(db,"biens");
  }

  static int NbrBiens(){
    print(biens.count());
    return biens.count();
  }
  static Future<List<Map<String,dynamic>>> getData() async{
    final arrData= await affectations.find().toList();
    return arrData;

  }
  static Future<List<Map<String,dynamic>>> getBiens() async{
    final arrData= await biens.find().toList();
    return arrData;

  }


  static Future<String> insert(MongoDbModel data) async{
    try{
      var result =await affectations.insertOne(data.toJson());
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
  static Future<void> updateBien(BienModel data) async{
    var result=await biens.findOne({"_id":data.id});
    result['code']=data.code;
    result['intitule']=data.intitule;
    result['unite']=data.unite;
    result['emplacement']=data.emplacement;
    var response=await biens.save(result);
    inspect(response);

  }
  static Future<void> update(MongoDbModel data,String bien) async{
    var result=await biens.findOne({"_id":data.id});
    print("result :"+result);
    result['biens'].add(bien);
     var response=await biens.save(result);
     inspect(response);

  }

  static Future<String> insertBien(BienModel data) async{
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
