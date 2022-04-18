import 'package:display/models/ModelBiens.dart';
import 'package:display/models/MongoDbModel.dart';
import 'package:display/dbHelper/mongodb.dart' ;
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter/material.dart';

class DisplayAffectations extends StatefulWidget {
  const DisplayAffectations({Key? key}) : super(key: key);

  @override
  State<DisplayAffectations> createState() => _DisplayAffectationsState();
}

class _DisplayAffectationsState extends State<DisplayAffectations> {

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
  final _formKey = GlobalKey<FormState>();
  var uniteController= TextEditingController();
  var emplacementController= TextEditingController();
  var codeController= TextEditingController();
  var bienController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
                children: [
                  Text('Liste des affectations :',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xffC34A36),
                      )),
                  SizedBox(height: 10,),

                  FutureBuilder(
                      future: MongoDatabase.getData(),
                      builder: (context,AsyncSnapshot snapshot){
                          if(snapshot.hasData){
                            var totalData =snapshot.data.length;
                            print('total data'+totalData.toString());
                            return OutlinedButton(onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                          Positioned(
                                            right: -40.0,
                                            top: -40.0,
                                            child: InkResponse(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: CircleAvatar(
                                                child: Icon(Icons.close),
                                                backgroundColor: Colors.red,
                                              ),
                                            ),
                                          ),
                                          Form(
                                            key: _formKey,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    TextFormField(
                                                      controller: bienController,
                                                      decoration: InputDecoration(labelText: "Le bien :"),

                                                    ),
                                                    TextFormField(
                                                      controller: uniteController,
                                                      decoration: InputDecoration(labelText: "Unité du bien :"),

                                                    ),
                                                    TextFormField(
                                                      controller: codeController,
                                                      decoration: InputDecoration(labelText: "Code du bien"),

                                                    ),
                                                    TextFormField(
                                                      controller: emplacementController,
                                                      decoration: InputDecoration(labelText: "Emplacement du bien"),

                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: ElevatedButton(
                                                        child: Text("Ajouter"),
                                                        onPressed: () async {
                                    for(var i = 0; i < snapshot.data.length; i++){
                                      _updateData(MongoDbModel.fromJson(snapshot.data), bienController.text);
                                    }

                                                       /*  for(var i = 0; i < snapshot.data.length; i++){
                                                           if(snapshot.data['libelle']==uniteController.text ){
                                                            // print(snapshot.data[i]['libelle']);
                                                            // final updatedData=MongoDbModel(id: snapshot.data[i]['_id'], libelle:snapshot.data[i]['libelle'], biens: snapshot.data[i]['biens']);
                                                             //print(snapshot.data[i]['biens'].toString() );
                                                            // snapshot.data[i]['biens'].add(bienController.text);

                                                            // _updateData(snapshot.data[i]['_id'],snapshot.data[i]['libelle'],snapshot.data[i]['biens']);
                                                           }

                                                         }*/

                                                         // _insertDataAffectation(snapshot.data,snapshot.data.biens,bienController.text,uniteController.text);
                                                        //  _insertDataBien(codeController.text,bienController.text,uniteController.text,emplacementController.text);
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });

                            },
                              child:Text('Ajouter'),
                            );
                          }else{
                            return Center(
                              child: Text('No data available'),
                            );

                        }
                      }),

                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: FutureBuilder(
                        future: MongoDatabase.getData(),
                        builder: (context,AsyncSnapshot snapshot){
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return const Center(
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
                                    var data=MongoDbModel.fromJson(snapshot.data[index]);
                                    return
                                      Container(
                                        width: double.infinity,
                                        child: GestureDetector(
                                          onTap: (){
                                            if(widgetVisible){
                                              setState(() {
                                                widgetVisible=false;
                                              });}
                                            else{
                                              setState(() {
                                                widgetVisible=true;
                                              });
                                            }
                                          },
                                          child: Card(
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [

                                                        Text(data.libelle,
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              // fontWeight: FontWeight.bold
                                                            )),

                                                        Column(
                                                          children: [

                                                            Text('${data.biens.length} ',
                                                                  style: TextStyle(
                                                                    fontSize: 16,
                                                                    color: Color(0xffC34A36).withOpacity(0.8),),
                                                                ),

                                                            IconButton(onPressed: (){
                                                              showDialog(
                                                                  context: context,
                                                                  builder: (BuildContext context) {
                                                                    return AlertDialog(
                                                                      content: Stack(
                                                                        overflow: Overflow.visible,
                                                                        children: <Widget>[
                                                                          Positioned(
                                                                            right: -40.0,
                                                                            top: -40.0,
                                                                            child: InkResponse(
                                                                              onTap: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: CircleAvatar(
                                                                                child: Icon(Icons.close),
                                                                                backgroundColor: Colors.red,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Form(
                                                                            key: _formKey,
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.all(10.0),
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: <Widget>[
                                                                                    TextFormField(
                                                                                      controller: bienController,
                                                                                      decoration: InputDecoration(labelText: "Le bien :"),

                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: uniteController,
                                                                                      decoration: InputDecoration(labelText: "Unité du bien :"),

                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: codeController,
                                                                                      decoration: InputDecoration(labelText: "Code du bien"),

                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: emplacementController,
                                                                                      decoration: InputDecoration(labelText: "Emplacement du bien"),

                                                                                    ),

                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: RaisedButton(
                                                                                        child: Text("Ajouter"),
                                                                                        onPressed: () async {
                                                                                          print(data.id.toString());
                                                                                          //_updateData(data, bienController.text);
                                                                                          _insertDataBien(codeController.text,bienController.text,uniteController.text,emplacementController.text);

                                                                                          /*  for(var i = 0; i < snapshot.data.length; i++){
                                                           if(snapshot.data['libelle']==uniteController.text ){
                                                            // print(snapshot.data[i]['libelle']);
                                                            // final updatedData=MongoDbModel(id: snapshot.data[i]['_id'], libelle:snapshot.data[i]['libelle'], biens: snapshot.data[i]['biens']);
                                                             //print(snapshot.data[i]['biens'].toString() );
                                                            // snapshot.data[i]['biens'].add(bienController.text);

                                                            // _updateData(snapshot.data[i]['_id'],snapshot.data[i]['libelle'],snapshot.data[i]['biens']);
                                                           }

                                                         }*/

                                                                                          // _insertDataAffectation(snapshot.data,snapshot.data.biens,bienController.text,uniteController.text);
                                                                                          //  _insertDataBien(codeController.text,bienController.text,uniteController.text,emplacementController.text);
                                                                                        },
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  });
                                                            }, icon: Icon(Icons.add),
                                                            ),
                                                          ],
                                                        ),

                                                      ]
                                                  ),
                                                  _biens(data),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );

                                  }
                              );
                            }else{
                              return Center(
                                child: Text('No data available'),
                              );
                            }
                          }
                        }),
                  ),

                ],
              )

          ),
        ),
      ),
    );
  }
  Widget displayCard(MongoDbModel data){
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                         /*   IconButton(onPressed: (){
                              //  print('pressed ${data.id}');

                            },
                              icon: Icon(Icons.add),
                            ),*/
                            IconButton(onPressed: (){
                              print('pressed ${data.id}');
                              hideWidget();
                            }, icon: Icon(Icons.keyboard_arrow_up),
                            ),
                            Text(data.libelle,
                                style: TextStyle(
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold
                                )),

                          ],
                        ),
                        TextButton(
                        onPressed: () { showWidget(); },
                        child: Text('${data.biens.length} biens',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffC34A36).withOpacity(0.8),),
                            )
                        ),

                      ]
                  ),
                  _biens(data),
                ],
              ),
            ),
          ),
        ),


      ],
    );
  }

  Future <void> _updateData(MongoDbModel data,String bien) async{
    final updatedData=MongoDbModel(id: data.id, libelle:data.libelle, biens: data.biens);
    await MongoDatabase.update(updatedData,bien);

  }


  Future<void> _insertDataBien(String code,String intitule,String unite, String emplacement) async{
    var _id= M.ObjectId();
    final data= BienModel(id: _id, code: code, intitule: intitule, unite: unite, emplacement: emplacement);
    var result=await MongoDatabase.insertBien(data);
    if(result.isNotEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Inserted id : ${_id.$oid}')));
      _clearAll();
    }

  }
  void _clearAll(){
   codeController.text="";
   uniteController.text="";
   bienController.text="";
   emplacementController.text="";
  }
}