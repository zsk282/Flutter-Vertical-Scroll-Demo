import 'package:flutter/material.dart';
import '../model/ImageModel.dart';

class ImageList extends StatelessWidget{

	final List<ImageModel> images;

	ImageList(this.images);

	Widget build(context){
		return ListView.builder(
			itemCount: images.length,
			itemBuilder: (context,int index){
				return buildImage(images[index]);
			},
		);  
	}

  Widget buildImage(ImageModel image){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey
        )
      ),
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(image.url),
            padding: EdgeInsets.only(
              bottom: 8.0
            ),
          ),
          Text(image.title)
        ],
      )
    );
  }
}