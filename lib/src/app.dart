// import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'model/ImageModel.dart';
import 'dart:convert';
import 'widgets/ImageList.dart';

// create a class that will be our custom widget
// class must extend statelessWidget class
class AppState extends State<App> {

int counter = 0;
List <ImageModel> images = [];

void fetchImage() async{
  counter++;
  var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
  
  var imageModel = ImageModel.fromJson(json.decode(response.body));  

  setState(() {
    images.add(imageModel);
  });
}

// must define a build method
// that this widget will show
  Widget build(context){
    return MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          title: Text('Lets see some images'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
        body: ImageList(images),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}