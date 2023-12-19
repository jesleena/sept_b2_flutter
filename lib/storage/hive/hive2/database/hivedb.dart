import 'package:hive/hive.dart';

import '../model/user_model.dart';

class HiveDb {
  //singleton class
  HiveDb._internal(); //private named costructor
  static HiveDb instance = HiveDb._internal(); //single instance creation
  factory HiveDb() {
    //to access instance
    return instance;
  }

  Future<List<User>>getUser() async{
    final db=await Hive.openBox<User>('userData');
    return db.values.toList();
  }

  Future<void> addUser(User newuser) async{
    final db=await Hive.openBox<User>('userData');
    db.put(newuser.id,newuser);
  }
}
