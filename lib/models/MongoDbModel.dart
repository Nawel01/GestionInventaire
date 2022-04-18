import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel{

    MongoDbModel({
      required this.id,
      required this.libelle,
      required this.biens,
});
    ObjectId id;
    String libelle;
    List<String> biens;

    factory MongoDbModel.fromJson(Map<String,dynamic> json) => MongoDbModel(
        id: json["_id"],
      libelle: json["libelle"],
      biens: List<String>.from(json["biens"].map((x) => x)),
    );

    Map<String,dynamic> toJson() => {
       "_id":id,
      "libelle": libelle,
      "biens": List<dynamic>.from(biens.map((x) => x)),

    };
}
