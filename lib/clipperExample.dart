import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MaterialApp(
    home: ClipperEx(),
  ));
}

class ClipperEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clipper"),
      ),
      body: ListView(
        children: [
          ClipRect(
            child: Align(
              widthFactor: .4,
                heightFactor: .7,
                child: Image.asset("assets/images/pic4.jpg")),
          ),
          SizedBox(height: 10,),
          ClipRRect(
            borderRadius:BorderRadius.circular(20) ,
          child: Image.asset("assets/images/pic5.jpg")),
          SizedBox(height: 10,),
          ClipOval(
              child: Image.asset("assets/images/pic12.jpg")
          ),
          SizedBox(height: 10,),
          ClipPath(
            clipper:TriangleClipper() ,
            child: Container(
              height: 100,
              color: Colors.purpleAccent,
            ),
          ),
          SizedBox(height: 10,),
          ClipPath(
            clipper: MovieTicketBothSidesClipper(),
            child: Container(
              height: 300,
              color: Colors.red,
            ),),
    ClipPath(
    clipper: MessageClipper(),
     child: Image.asset("assets/images/pic11.jpg")

          ),
          SizedBox(height: 20,),

          ClipPath(
            clipper: StarClipper(6),
            child: Container(
              height: 700,
              color: Colors.green,
            ),),
        ],
      ),
    );
  }
}
