import 'package:flutter/material.dart';
import 'package:sept_b2_flutter/gridview/gridview1.dart';
import 'package:sept_b2_flutter/gridview/gridview2.dart';
import 'package:sept_b2_flutter/gridview/gridview4.dart';

void main() {
  runApp(MaterialApp(
    home: BottomNav(),
  ));
}

class BottomNav extends StatefulWidget {
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;
  var screens = [Gridview1(),
    Gridview2(),Gridview4()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapindex) {
          setState(() {
            index = tapindex;
          });
        },
        backgroundColor: Colors.green,
        currentIndex: index,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
        ],
      ),
      body: screens[index],
    );
  }
}
