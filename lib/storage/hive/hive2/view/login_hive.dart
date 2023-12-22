import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sept_b2_flutter/storage/hive/hive2/model/user_model.dart';
import 'package:sept_b2_flutter/storage/hive/hive2/view/home_hive.dart';
import 'package:sept_b2_flutter/storage/hive/hive2/view/reg_hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../database/hivedb.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final dbDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(dbDir.path); // init hive
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('userData');
  runApp(GetMaterialApp(home: HiveLogin(),));

}
class HiveLogin extends StatelessWidget {
  final email_ctrl = TextEditingController();
  final pwd_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: email_ctrl,
              decoration: InputDecoration(hintText: "email"),
            ),
            TextField(
              controller: pwd_ctrl,
              decoration: InputDecoration(hintText: "password"),
            ),
            ElevatedButton(onPressed: () async{
              final regUserlist=await HiveDb.instance.getUser();
              validate_login(regUserlist);
            }, child: Text("Login")),
            TextButton(onPressed: (){
              Get.to(HiveReg());
            }, child:Text("Didn'y have an account? Register here.."))
          ],
        ),
      ),
    );
  }

  Future<void> validate_login(List<User> regUserlist) async{
   final eemail=email_ctrl.text.trim();
   final epwd=pwd_ctrl.text.trim();
   bool userFound=false;
   if(eemail !='' && epwd !=''){
     await Future.forEach(regUserlist, (user) {
       if(eemail==user.email && epwd==user.password)
       {
         userFound=true;
       }
       else{userFound=false;}
     }
     );
     if(userFound==true){
       Get.snackbar("Success", "Login success");
       Get.to(HiveHome());
     }
     else{
       Get.snackbar("Error", "User not found");
     }
   }
   else{Get.snackbar("Error", "fields must not be empty");}
  }
}
