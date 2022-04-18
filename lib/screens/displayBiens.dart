import 'package:display/models/ModelBiens.dart';
import 'package:display/models/MongoDbModel.dart';
import 'package:display/dbHelper/mongodb.dart';
import 'package:flutter/material.dart';

class DisplayBiens extends StatefulWidget {
  const DisplayBiens({Key? key}) : super(key: key);

  @override
  State<DisplayBiens> createState() => _DisplayBiensState();
}

class _DisplayBiensState extends State<DisplayBiens> {

  final _formKey = GlobalKey<FormState>();
  var uniteController= TextEditingController();
  var emplacementController= TextEditingController();
  var codeController= TextEditingController();
  var bienController=TextEditingController();



  @override
  Widget build(BuildContext context) {
   /* BienModel donnees=ModalRoute.of(context)!.settings.arguments as BienModel;

    if(donnees!= null){
      codeController.text=donnees.code;
      bienController.text=donnees.intitule;
      uniteController.text=donnees.unite;
      emplacementController.text=donnees.emplacement;
    }*/

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: SafeArea(
                child: Column(
                  children: [
                    Text('Liste des biens :',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xffC34A36),
                        )),
                    SizedBox(height: 10,),
                    FutureBuilder(
                        future: MongoDatabase.getBiens(),
                        builder: (context,AsyncSnapshot snapshot){
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(
                              child:Container(
                                height: 60,
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:Color(0xffFFB497),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                          }
                            else{
                                 return   Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text('Total des biens : ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                     Container(
                                       height: 60,
                                       width: 150,
                                       decoration: BoxDecoration(
                                         border: Border.all(
                                           color:Color(0xffFFB497),
                                         ),
                                         borderRadius: BorderRadius.circular(10.0),
                                       ),
                                       child: Center(
                                         child: Text('${snapshot.data.length} biens',style: TextStyle(fontSize: 16),),
                                       ),
                                     ),
                                   ],
                                 );

                               }



                        }
                    ),
                    SizedBox(height: 10,),
                    FutureBuilder(
                        future: MongoDatabase.getBiens(),
                        builder: (context,AsyncSnapshot snapshot){
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          else{
                            if(snapshot.hasData){
                              var totalData =snapshot.data.length;
                              //  print('total data'+totalData.toString());
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context,index){
                                    var data=BienModel.fromJson(snapshot.data[index]);
                                    return  Container(
                                      width: double.infinity,
                                      child: SingleChildScrollView(
                                        child: Card(

                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(data.intitule,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,

                                                          ),
                                                        ),
                                                        Text(data.code,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(0xffC34A36),
                                                            //fontWeight: FontWeight.bold,

                                                          ),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Row(

                                                      children: [
                                                        Text('Unité :',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(0xffC34A36).withOpacity(0.8),
                                                            //fontWeight: FontWeight.bold,

                                                          ),),
                                                        SizedBox(width: 3,),
                                                        Text(data.unite,
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            // color: Color(0xffC34A36),
                                                            //fontWeight: FontWeight.bold,

                                                          ),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text('Emplacement :',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Color(0xffC34A36).withOpacity(0.8),
                                                                //fontWeight: FontWeight.bold,

                                                              ),),
                                                            SizedBox(width: 3,),
                                                            Text(data.emplacement,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                // color: Color(0xffC34A36),
                                                                //fontWeight: FontWeight.bold,

                                                              ),),
                                                          ],
                                                        ),
                                                        IconButton(
                                                          icon: Icon(
                                                            Icons.edit, size: 22,),
                                                          onPressed: (){
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
                                                                                    decoration: InputDecoration(labelText: "Le bien :",hintText: data.intitule),

                                                                                  ),
                                                                                  TextFormField(
                                                                                    controller: uniteController,
                                                                                    decoration: InputDecoration(labelText: "Unité du bien :",hintText: data.unite),

                                                                                  ),
                                                                                  TextFormField(
                                                                                    controller: codeController,
                                                                                    decoration: InputDecoration(labelText: "Code du bien",hintText: data.code),

                                                                                  ),
                                                                                  TextFormField(
                                                                                    controller: emplacementController,
                                                                                    decoration: InputDecoration(labelText: "Emplacement du bien",hintText: data.emplacement),

                                                                                  ),

                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: RaisedButton(
                                                                                      child: Text("Modifier"),
                                                                                      onPressed: ()  {
                                                                                        _updateData(data.id,codeController.text,bienController.text,uniteController.text,emplacementController.text);
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
                                                                },routeSettings: RouteSettings(arguments: data));
                                                          },


                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),

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
                  ],
                )
            ),
          ),
        )


    );
  }

  Future <void> _updateData(var id,String code,String intitule,String unite,String emplacement) async{
    final updatedData=BienModel(id: id, code: code, intitule: intitule, unite: unite, emplacement: emplacement);
    await MongoDatabase.updateBien(updatedData);

  }
}








