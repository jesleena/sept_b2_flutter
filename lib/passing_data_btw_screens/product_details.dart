import 'package:flutter/material.dart';
import 'package:sept_b2_flutter/passing_data_btw_screens/dummydata.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final idNew=ModalRoute.of(context)?.settings.arguments;
    final productNew=products.firstWhere((e) =>e["id"]==idNew);
    return Scaffold(
      body:Center(
        child: Card(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
            Image.asset(productNew["image"],height: 200,width: 200,),
            Text(productNew["name"]),
            Text(productNew["description"]),
            Text("${productNew["price"]}")
          ],),
        ),
      ) ,

    );
  }
}
