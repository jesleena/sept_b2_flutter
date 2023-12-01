import 'package:flutter/material.dart';
import 'package:sept_b2_flutter/shared_preference/shared_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String username;
  late SharedPreferences preferences;

  @override
  void initState() {
    fetch_data();
    super.initState();
  }

  void fetch_data() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("uname")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello $username"),
        actions: [IconButton(onPressed: () async{
          final SharedPreferences preferences = await SharedPreferences.getInstance()!;
          preferences.setBool("loggedin", false);
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SharedLogin()));
        }, icon: Icon(Icons.logout))],
      ),
    );
  }
}
