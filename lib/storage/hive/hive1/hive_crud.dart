import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('todo_box');
  runApp(MaterialApp(
    home: Hive_Crud(),
  ));
}

class Hive_Crud extends StatefulWidget {
  @override
  State<Hive_Crud> createState() => _Hive_CrudState();
}

class _Hive_CrudState extends State<Hive_Crud> {
  final todo=Hive.box('todo_box');
  List<Map<String, dynamic>> task = [];
  final tname_ctrl = TextEditingController();
  final tcont_ctrl = TextEditingController();
@override
  void initState() {
  read_task();
    super.initState();
  }

  void read_task() {
  final task_from_hive=todo.keys.map((key)//to get all map corresponding to each key
  {
    final single_task=todo.get(key); //values at single task corresponding tp a key
    return{
      'id':key,
      'tname':single_task['task_name'],
      'tcont':single_task['task_cont']
    };

  }).toList();
  setState(() {
    task=task_from_hive;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: task.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.task),
                    title: Text(task[index]['tname']),
                    subtitle: Text(task[index]['tcont']),
                    trailing: Wrap(
                      children: [
                        IconButton(onPressed: () {create_edit_task(task[index]['id']);}, icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          create_edit_task(null);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void create_edit_task(int? itemkey) {
    if (itemkey != null) {
      final current_task = task.firstWhere((element) => element['id']== itemkey);
      tname_ctrl.text    = current_task['tname'];
     tcont_ctrl.text = current_task['tcont'];
    }

    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
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
                  controller: tname_ctrl,
                  decoration: InputDecoration(hintText: "Task name"),
                ),
                TextField(
                  controller: tcont_ctrl,
                  decoration: InputDecoration(hintText: "Task name"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (itemkey == null) {
                        create_task({
                          "task_name": tname_ctrl.text.trim(),
                          "task_cont": tcont_ctrl.text.trim()
                        });
                      }
                      if (itemkey != null) {
                        edit_task(itemkey,
                            {
                          "task_name": tname_ctrl.text.trim(),
                          "task_cont": tcont_ctrl.text.trim()
                           });
                      }
                      tname_ctrl.text='';
                      tcont_ctrl.text='';
                      Navigator.pop(context);
                    },
                    child: Text(itemkey == null ? "Create task" : "Edit Task"))
              ],
            ),
          );
        });
  }

  Future<void> create_task(Map<String, String> newtask) async {
  await todo.add(newtask);
  read_task();

  }

  Future<void> edit_task(int itemkey, Map<String, String> editedTask)async {
  await todo.put(itemkey,editedTask);
  read_task();
  }

}
