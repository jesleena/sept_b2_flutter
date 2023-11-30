import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: OrientationEx(),
  ));
}

class OrientationEx extends StatelessWidget {
  var orientation, height, width;

  @override
  Widget build(BuildContext context) {
    // getting the orientation of the app
    orientation = MediaQuery.of(context).orientation;
    //size of the window
    //size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Orientation Media Query"),
        backgroundColor: Colors.green,
      ),
      // checking the orientation
      body: orientation == Orientation.portrait
          ? Container(
        color: Colors.blue,
        height: height / 2,
        width: width / 2,
        child: Center(child: Text("portrait")),
      )
          : Container(
        height: height / 2,
        width: width ,
        color: Colors.red,
        child: Center(child: Text("landscape")),
      ),
    );
  }
}
