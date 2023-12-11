import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sept_b2_flutter/shared_preference/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedSignup extends StatefulWidget {
  @override
  State<SharedSignup> createState() => _SharedSignupState();
}

class _SharedSignupState extends State<SharedSignup> {
  final name_ctrl = TextEditingController();
  final uname_ctrl = TextEditingController();
  final pwd_ctrl = TextEditingController();
  bool showpwd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset('assets/icon1.png', height: 100, width: 100,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Sign Up",
                style: GoogleFonts.lato(
                  fontSize: 50,
                  color: Colors.brown,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "create an account, its free",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Name"),
                controller: name_ctrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "UserName"),
                controller: uname_ctrl,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pwd_ctrl,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
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
                    hintText: "Password"),
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    storedata();
                  },
                  child: Text(
                    "Sign up",
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

          ],
        ),
      ),
    );
  }

  void storedata() async {
    final SharedPreferences preferences = await SharedPreferences
        .getInstance()!;
    String name = name_ctrl.text;
    String username = uname_ctrl.text;
    String password = pwd_ctrl.text;
    if (username != "" && password != "") {
      preferences.setString("name", name);
      preferences.setString("uname", username);
      preferences.setString("password", password);
      preferences.setBool("loggedin", true);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
    }
  }

}
