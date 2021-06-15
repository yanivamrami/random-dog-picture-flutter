import 'dart:io';

import 'package:dog/service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomDogScreen extends StatefulWidget {
  // const RandomDogScreen({Key key}) : super(key: key);

  @override
  _RandomDogScreenState createState() => _RandomDogScreenState();
}

String imageUrl;

class _RandomDogScreenState extends State<RandomDogScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          FutureBuilder(
            future: ApiService().getDogPicture(),
            builder: (_, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return CupertinoActivityIndicator();
              else if (snapshot.hasError)
                return Text("Cannot load image");
              else {
                imageUrl = snapshot.data;
                return Image(image: NetworkImage(imageUrl));
              }
            },
          ),
          // Image(image: NetworkImage(imageUrl)),
          TextButton(
            onPressed: () async {
              // imageUrl = await ApiService().getDogPicture();
              setState(() {});
            },
            child: Text('Fetch Image'),
          )
        ],
      ),
    );
  }
}
