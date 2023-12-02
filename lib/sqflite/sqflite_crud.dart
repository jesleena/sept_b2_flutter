import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Sqflite_CRUD()));
}

class Sqflite_CRUD extends StatefulWidget {
  @override
  State<Sqflite_CRUD> createState() => _Sqflite_CRUDState();
}

class _Sqflite_CRUDState extends State<Sqflite_CRUD> {
  final name_ctrl = TextEditingController();
  final phone_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CONTACTS")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showSheet(null),
        child: Icon(Icons.add),
      ),
    );
  }
  void showSheet(int? id) async {
    //if (id != null) {}
    if (id == null) {
      showModalBottomSheet(
          elevation: 5,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.only(
                     top: 15,
                    left: 15,
                    right: 15,
                     bottom: MediaQuery.of(context).viewInsets.bottom + 80),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: name_ctrl,
                      decoration: InputDecoration(hintText: "Name"),
                    ),
                    TextField(
                      controller: phone_ctrl,
                      decoration: InputDecoration(hintText: "Phone"),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (id == null) {
                          // await create_contact();
                          }
                          if (id != null) {
                            // await update_contact();
                          }
                        },
                        child: Text(
                            id == null ? "create contact" : "update contact"))
                  ],
                ),
            );
          });
    }
  }

}
