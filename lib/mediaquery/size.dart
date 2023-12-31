// Media Query Widget- Used to Create responsive UI's
//Similar to the Expanded Widget
// Can be used by calling its builder -MediaQuery.of
// Doesn't need any additional dependencies
//import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Media(),
  ));
}

class Media extends StatelessWidget {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Media Query"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.yellow,
        height: 350,
        width: 400,
        // height: height * 0.6, //half of the height size
        // width: width * 0.5, //half of the width size
      ),
    );
  }
}