import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: StackEx(),
  ));
}

class StackEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
      ),
      body: Stack(
        children: [
          Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/pic12.jpg"),fit: BoxFit.fill)),
          ),
          Text("Name",style: TextStyle(fontSize: 30),),
          Positioned(
              left: 300,
              right: 10,
              top: 350,
              child: Text("place",style: TextStyle(fontSize: 25,color: Colors.white),),)
        ],
      ),
    );
  }
}
