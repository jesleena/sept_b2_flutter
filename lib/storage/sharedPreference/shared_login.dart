import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';


void main() {
  runApp(MaterialApp(
    home: LoginPageShared(),
  ));
}

class LoginPageShared extends StatefulWidget {
  @override
  State<LoginPageShared> createState() => _LoginPageSharedState();
}

class _LoginPageSharedState extends State<LoginPageShared> {
  final uname_controller = TextEditingController();
  final pass_controller = TextEditingController();
  late SharedPreferences preferences; // shared preference instance
  late bool loggedin; // tp store value from shard pref

  @override
  void initState() {
    check_user_already_login();
    super.initState();
  }

  void check_user_already_login() async {
    preferences = await SharedPreferences.getInstance()!;
    ///  if  first condition is null  execute second statement
    loggedin = preferences.getBool('loggedin') ?? false;
    if (loggedin == true) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: uname_controller,
                decoration: const InputDecoration(
                    hintText: "UserName", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: pass_controller,
                decoration: const InputDecoration(
                    hintText: "PassWord", border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  preferences = await SharedPreferences.getInstance()!;
                  String username = uname_controller.text;
                  String password = pass_controller.text;

                  if (username != "" && password != "") {
                    preferences.setString("uname", username);
                    preferences.setBool('loggedin', true);
                    // if the user is logged in value of newuser will be false
                    // if the user is logged out value of newuser will be true

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Home()));
                  }
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'home.dart';
// void main(){
//   runApp(MaterialApp(home: SharedLogin(),));
// }
// class SharedLogin extends StatefulWidget {
//   @override
//   State<SharedLogin> createState() => _SharedLoginState();
// }
//
// class _SharedLoginState extends State<SharedLogin> {
//   final uname_ctrl = TextEditingController();
//   final pwd_ctrl = TextEditingController();
//   late SharedPreferences preferences;
//   late bool newuser;
// @override
//   void initState() {
//    check_user_loggedin();
//     super.initState();
//   }
//
//   void check_user_loggedin() async{
//   /// if first statement is null execute second statement
//     newuser = preferences.getBool('newuser') ?? true;
//     if (newuser == false) {
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => Home()));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login"),
//       ),
//       body: Center(
//         child: Column(children: [
//           TextField(
//             controller: uname_ctrl,
//             decoration: InputDecoration(
//                 hintText: "user name", border: OutlineInputBorder()),
//           ),
//           TextField(
//             controller: pwd_ctrl,
//             decoration: InputDecoration(
//                 hintText: "password", border: OutlineInputBorder()),
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 preferences = await SharedPreferences.getInstance()!;
//                 String username=uname_ctrl.text;
//                 String password=pwd_ctrl.text;
//                 if(username!="" && password!=""){
//                   preferences.setString("uname",username);
//                   preferences.setBool("newuser",false);
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
//                 }
//               },
//               child: const Text("Login"))
//         ]),
//       ),
//     );
//   }
//
//
// }
//
