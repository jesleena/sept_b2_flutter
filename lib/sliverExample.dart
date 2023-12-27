import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SliverExample()));
}

class SliverExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // pinned: true,
            floating: true,
            elevation: 5,
            title: Text("Sliverss.."),
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "search", prefixIcon: Icon(Icons.search)),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              height: 50,
              child: Text("hello"),
            ),
          ),
          SliverGrid(
              delegate:
                  SliverChildBuilderDelegate(childCount: 16,(context, index) => Container(
                        color: Colors.blue,
                      )),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing:5,crossAxisSpacing:5,crossAxisCount: 3)),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) => ListTile(
                    leading: Text("hello user$index"),
                    trailing: Icon(Icons.person),
                  )))
          // SliverList(delegate: SliverChildListDelegate(List.generate(30, (index)=>ListTile(
          //   leading: Text("hello user$index"),
          //   trailing: Icon(Icons.person),
          // ) )))
        ],
      ),
    );
  }
}
