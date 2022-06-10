import 'dart:convert';
import 'package:grouped_list/grouped_list.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'CatModel.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats API',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cats API'),
    );
  }
}
List<CatModel> _CatDetails = [];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String apikey = "api_key=5b493184-5a38-4ba6-a63d-151a3a012a7a ";


  Future<String?> getCatDetails() async{

      final response = await http.get(Uri.parse("https://api.thecatapi.com/v1/breeds?attach_breed=0"),headers: {"Authorization": apikey});
      final responseJson = json.decode(response.body);

      setState(() {

        for (Map cats in responseJson) {
          _CatDetails.add(CatModel.fromJson(cats));

        }
      }

      );



  }
  @override
  void initState() {
    getCatDetails();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,
            title: const Text(
                "Cats API",style: TextStyle(color: Colors.white))),
        body: Column(
            children: <Widget>[
              Expanded(
                  child:GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,

                    ),
                    itemCount: _CatDetails.length,
                      itemBuilder: (BuildContext context,int index) {
                        return Card(
                            child: Container(
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 7,
                                    color: Color(0x2F1D2429),
                                    offset: Offset(0, 3),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                      child: Row(
                                        children: [
                                        Align(
                                        alignment: Alignment.center,
                                          child: Text(
                                            _CatDetails[index].name,style: const TextStyle(fontWeight: FontWeight.bold)

                                          ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        "https://cdn2.thecatapi.com/images/" + _CatDetails[index].reference_image_id + ".jpg",
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              _CatDetails[index].origin,

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [

                                           Expanded(
                                             child: Text(
                                               _CatDetails[index].wikipedia_url,



                                        ),
                                           ),
                                      ],
                                    ),
                                    Row(
                                      children: [

                                        Expanded(
                                          child: Text("Temperament: "+
                                            _CatDetails[index].temperament,



                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [

                                        Expanded(
                                          child: Text("Life Span: "+
                                            _CatDetails[index].life_span,



                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [

                                        Expanded(
                                          child: Text("Weight: "+
                                            _CatDetails[index].weight_imperial,



                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [

                                        Expanded(
                                          child: Text("Alt names: "+
                                            _CatDetails[index].alt_names,



                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                        );
                      },  )

              )]));
  }

}

