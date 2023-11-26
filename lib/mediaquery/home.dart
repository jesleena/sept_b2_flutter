import 'package:flutter/material.dart';
import 'bigScreen.dart';
import 'mobileScreen.dart';

void main(){
  runApp(MaterialApp(home: HomePage(),));
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var devicewidth = MediaQuery.of(context).size.width;
    if(devicewidth < 600) {
      return MobileScreen();
    }else {
      return BigScreen();

    }
  }
}