import 'package:flutter/material.dart';
import 'package:sept_b2_flutter/sqflite/dboperation.dart';

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
  List<Map<String, dynamic>> contacts = [];
  var isloading = true;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    final data = await SQLHelper.readData();
    setState(() {
      contacts = data;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CONTACTS")),
      body: isloading
          ? Text("No Data")
          : ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
              return Card(child: ListTile(
                title: Text(contacts[index]['name']),
                subtitle: Text(contacts[index]['phone']),
                trailing: Wrap(children: [
                  IconButton(onPressed: (){showSheet(contacts[index]['id']);}, icon:Icon(Icons.edit)),
                  IconButton(onPressed: (){
                    delete_contact(contacts[index]['id']);
                  }, icon:Icon(Icons.delete)),
                ],),
              ),);
            }),






      floatingActionButton: FloatingActionButton(
        onPressed: () => showSheet(null),
        child: Icon(Icons.add),
      ),
    );
  }

  void showSheet(int? id) {

    if(id != null){
var selected_contact=contacts.firstWhere((element) => element['id']==id);
name_ctrl.text=selected_contact['name'];
phone_ctrl.text=selected_contact['phone'];
    }

    showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: name_ctrl,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                TextField(
                  controller: phone_ctrl,
                  decoration: InputDecoration(hintText: "phone"),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (id == null) {
                        await create_contact();
                      }

                      if (id != null) {
                         await update_contact(id);
                      }
                    },
                    child: Text(id == null ? "create" : "update"))
              ],
            ),
          );
        });
  }

  Future<void> create_contact() async {
    await SQLHelper.createContact(name_ctrl.text, phone_ctrl.text);
    loadData();
    name_ctrl.text='';
    phone_ctrl.text='';
    Navigator.pop(context);
  }

 Future<void> update_contact(int? id)async {
    await SQLHelper.updateContact(id,name_ctrl.text,phone_ctrl.text);
    loadData();
    name_ctrl.text='';
    phone_ctrl.text='';
    Navigator.pop(context);
 }

  Future<void> delete_contact(int? id) async{
    await SQLHelper.deleteContact(id);
    loadData();
  }

}
