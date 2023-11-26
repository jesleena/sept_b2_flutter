import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.green),
    home: DrawerEx(),
  ));
}

class DrawerEx extends StatelessWidget {
  var colour1 = [Colors.red, Colors.blue, Colors.green];
  var colour2 = [Colors.purple, Colors.pink, Colors.orange];
  var colour3 = [Colors.yellow, Colors.brown, Colors.black];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Drawer & Expansion Tile"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.pink[100],
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/pic11.jpg"),
                        fit: BoxFit.fill)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/pic5.jpg"),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/pic7.jpg"),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/pic4.jpg"),
                  ),
                ],
                accountName: Text("Luminar"),
                accountEmail: Text("luminar@gmail.com")),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("home"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text("Tile1"),
            subtitle: Text("Colors"),
            children: List.generate(
                3,
                (index) => ListTile(
                        leading: CircleAvatar(
                      backgroundColor: colour1[index],
                    ))),
          ),
          ExpansionTile(
            title: Text("Tile1"),
            subtitle: Text("Colors"),
            children: List.generate(
                3,
                    (index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colour2[index],
                    ))),
          ),
          ExpansionTile(
            title: Text("Tile1"),
            subtitle: Text("Colors"),
            children: List.generate(
                3,
                    (index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colour3[index],
                    ))),
          ),

        ],
      ),
    );
  }
}
