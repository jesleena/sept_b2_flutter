import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: SharedLogin(),
  ));
}

class SharedLogin extends StatefulWidget {
  @override
  State<SharedLogin> createState() => _SharedLoginState();
}

class _SharedLoginState extends State<SharedLogin> {
  final uname_ctrl = TextEditingController();
  final pwd_ctrl = TextEditingController();
  late SharedPreferences preferences;
  late bool loggedin;

  @override
  void initState() {
    check_user_loggedin();
    super.initState();
  }

  void check_user_loggedin() async {
    preferences = await SharedPreferences.getInstance()!;
    /// if first statement is null execute second statement
    loggedin = preferences.getBool("loggedin") ?? false;
    if (loggedin == true) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(children: [
          TextField(
            controller: uname_ctrl,
            decoration: InputDecoration(
                hintText: "user name", border: OutlineInputBorder()),
          ),
          TextField(
            controller: pwd_ctrl,
            decoration: InputDecoration(
                hintText: "password", border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: () async {
                preferences = await SharedPreferences.getInstance()!;
                String username = uname_ctrl.text;
                String password = pwd_ctrl.text;
                if (username != "" && password != "") {
                  preferences.setString("uname", username);
                  preferences.setBool("loggedin", true);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                }
              },
              child: const Text("Login"))
        ]),
      ),
    );
  }
}
