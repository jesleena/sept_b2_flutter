import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sept_b2_flutter/shared_preference/shared_signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
  late bool loggedin;
  bool showpwd=true;
  @override
  void initState() {
    check_user_loggedin();
    super.initState();
  }

  void check_user_loggedin() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance()!;
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

      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Login",
              style: GoogleFonts.lato(
                fontSize: 50,
                color: Colors.brown,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Login with your credentials",
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: uname_ctrl,style: GoogleFonts.lato(
              fontSize: 20,
              color: Colors.black,
              fontStyle: FontStyle.italic,),

              decoration: InputDecoration(
                  hintText: "user name", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pwd_ctrl,style: GoogleFonts.lato(
              fontSize: 20,
              color: Colors.black,
              fontStyle: FontStyle.italic,),
                obscureText: showpwd,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (showpwd) {
                              showpwd = false;
                            } else {
                              showpwd = true;
                            }
                          });
                        },
                        icon: Icon(showpwd == true
                            ? Icons.visibility
                            : Icons.visibility_off_sharp)),
                    border: OutlineInputBorder(),
                    hintText: "Password"),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: ()
                {
                  validate_login();


                },
                child: Text(
                  "Login",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white60,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: const ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll<Color>(Colors.brown),
                )),
          ),

          const SizedBox(
            height: 10,
          ),

          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SharedSignup()));
            },
            child:  Text("Dont have an account? Register Here",style: GoogleFonts.lato(
              fontSize: 20,
              color: Colors.black,
              fontStyle: FontStyle.italic,
            ),),),

        ]),
      ),
    );
  }

  void validate_login()async {

      final SharedPreferences preferences = await SharedPreferences.getInstance()!;
      String username = uname_ctrl.text;
      String password = pwd_ctrl.text;
      String? uname=preferences.getString("uname");
      String? paswd=preferences.getString("password");
      if (username == uname && password != paswd) {
        //preferences.setString("uname", username);
        preferences.setBool("loggedin", true);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Home()));
      }

  }


}
