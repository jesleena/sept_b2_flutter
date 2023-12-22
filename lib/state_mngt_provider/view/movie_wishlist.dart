import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provder/movie_provider.dart';

class Wishlist1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wishlistt = context.watch<MovieProvider>().wishlist;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
            style:GoogleFonts.pacifico(fontSize: 30,
            )
        ),
      ),
      body: ListView.builder(
          itemCount: wishlistt.length,
          itemBuilder: (context, index) => Card(
                color: Colors.pink[100],
                child: ListTile(
                  title: Text(wishlistt[index].title,style:GoogleFonts.pacifico(fontSize: 20,
                  )),
                  subtitle: Text(wishlistt[index].time,style:GoogleFonts.pacifico(fontSize: 20,
                  )),
                  trailing: IconButton(
                      onPressed: () {
                        context
                            .read<MovieProvider>()
                            .remove_wishlist(wishlistt[index]);
                      },
                      icon: Icon(
                        Icons.delete_outline,color: Colors.red[900],
                      )),
                ),
              )),
    );
  }
}
