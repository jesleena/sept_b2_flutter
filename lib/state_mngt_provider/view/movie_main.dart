import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sept_b2_flutter/state_mngt_provider/provder/movie_provider.dart';
import 'package:sept_b2_flutter/state_mngt_provider/view/movie_wishlist.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MovieProvider>(
      create: (context) => MovieProvider(),
      child: MaterialApp(home: MovieMain(),),
    ),
  );
}

class MovieMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var moviess = context.watch<MovieProvider>().movies;
    var wishlistt = context.watch<MovieProvider>().wishlist;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies",style:GoogleFonts.pacifico(fontSize: 30,
          )),),

      body: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Wishlist1()));
              },
              icon: Icon(Icons.favorite,color: Colors.red,),
              label: Text("Wishlist ${wishlistt.length}",style:GoogleFonts.pacifico(fontSize: 20,
              ))),
          Expanded(
              child: ListView.builder(
                  itemCount: moviess.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.purple[200],
                        child: ListTile(
                          title: Text(moviess[index].title,style:GoogleFonts.pacifico(fontSize: 20,
                          )),
                          subtitle: Text(moviess[index].time,style:GoogleFonts.pacifico(fontSize: 20,
                          )),
                          trailing: IconButton(
                              onPressed: () {
                                if (!wishlistt.contains(moviess[index])) {
                                  context
                                      .read<MovieProvider>()
                                      .add_wishlist(moviess[index]);
                                } else {
                                  context
                                      .read<MovieProvider>()
                                      .remove_wishlist(moviess[index]);
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: wishlistt.contains(moviess[index])
                                    ? Colors.red
                                    : Colors.black54,
                              )),
                        ),
                      )))
        ],
      ),
    );
  }
}
