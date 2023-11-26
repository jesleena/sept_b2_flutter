import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MaterialApp(
    home: Clipper1(),
  ));
}

class Clipper1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipRect(
            child: Align(
                widthFactor: .4,
                heightFactor: .6,
                child: Image.asset("assets/images/pic4.jpg")),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image.asset("assets/images/pic8.jpg"),
          ),
          ClipOval(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset("assets/images/pic9.jpg"),
          ),
          ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/pic1.jpg"),
                    fit: BoxFit.fill),
              ),
             // color: Colors.deepOrange,
              //child: Image.asset("assets/images/pic9.jpg"),
            ),
          ),
          ClipPath(
            clipper: MovieTicketBothSidesClipper(),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/pic10.jpg"),
                    fit: BoxFit.fill),
              ),
              height: 100,
              //color: Colors.green,
              //child: Center(child:Image.asset("assets/images/pic10.jpg")),
            ),
          )
        ],
      ),
    );
  }
}
