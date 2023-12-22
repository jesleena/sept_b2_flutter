import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sept_b2_flutter/storage/hive/hive2/model/user_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sept_b2_flutter/storage/hive/hive2/view/login_hive.dart';
import '../database/hivedb.dart';


class HiveReg extends StatelessWidget {
final email_ctrl=TextEditingController();
final pwd_ctrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("registration")),
      body: Column(
        children: [
          TextField(
            controller: email_ctrl,
            decoration: InputDecoration(hintText: "email"),
          ),
          TextField(
            controller: pwd_ctrl,
            decoration: InputDecoration(hintText: "password"),
          ),
          ElevatedButton(onPressed: ()async{
            final regUserlist=await HiveDb.instance.getUser();
            validate_signup(regUserlist);
            email_ctrl.text='';
            pwd_ctrl.text='';
          }, child: const Text("Register here"))
        ],
      ),
    );
  }

  void validate_signup(List<User> regUserlist)async{
    final eemail=email_ctrl.text.trim();
    final epwd=pwd_ctrl.text.trim();
    bool userFound=false;
    final validateEmail=EmailValidator.validate(eemail);

    if(eemail!=''&&epwd!=''){//to check empty
      if(validateEmail==true){
        await Future.forEach(regUserlist, (user) {//to get each user from regUserList
          if(user.email==eemail){  // to check email already existing
            userFound=true;
          }
          else{
            userFound=false;
          }
        });
        if(userFound==true){
          Get.snackbar("error", "User already exist",colorText: Colors.red);
        }
        else{
          //to check password
          final validatePassword=check_pwd(epwd);
          if(validatePassword==true){
            final newuser=User(email: eemail, password: epwd);
            await HiveDb.instance.addUser(newuser);
            Get.snackbar("Success", "Registration success",colorText: Colors.green);
            Get.to(HiveLogin());
          }
        }
      }
      else{
        Get.snackbar("Error", "enter a valid email",colorText: Colors.red);
      }
    }
    else{
      Get.snackbar("Error", "email & password should not be empty",colorText: Colors.red);
    }
  }

 bool check_pwd(String epwd) {
    if(epwd.length<6){Get.snackbar("Error","password length should>=6",colorText: Colors.red);
    return false;}
    else return true;
 }
}
