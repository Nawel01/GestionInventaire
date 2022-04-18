// To parse this JSON data, do
//
//     final bienModel = bienModelFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

BienModel bienModelFromJson(String str) => BienModel.fromJson(json.decode(str));

String bienModelToJson(BienModel data) => json.encode(data.toJson());

class BienModel {
  BienModel({
    required this.id,
    required this.code,
    required this.intitule,
    required this.unite,
    required this.emplacement,
  });

  ObjectId id;
  String code;
  String intitule;
  String unite;
  String emplacement;

  factory BienModel.fromJson(Map<String, dynamic> json) => BienModel(
    id: json["_id"],
    code: json["code"],
    intitule: json["intitule"],
    unite: json["unite"],
    emplacement: json["emplacement"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id.toJson(),
    "code": code,
    "intitule": intitule,
    "unite": unite,
    "emplacement": emplacement,
  };
}


