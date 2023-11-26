import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:sept_b2_flutter/gridview/carousael.dart';
import 'package:sept_b2_flutter/sliverExample.dart';
void main() {
  runApp(MaterialApp(home: OnBoardingEx()));
}
class OnBoardingEx extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    PageDecoration pageDecoration=PageDecoration(
      titleTextStyle: TextStyle(color: Colors.purple,
      fontSize: 35,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontStyle: FontStyle.italic,
      ),
      imagePadding: EdgeInsets.all(12)
      
    );
    
    return IntroductionScreen(
      pages: [
        PageViewModel(
          decoration: pageDecoration,
            title: "Page1",
            image: Image.asset("assets/images/icon2.png"),
            body: "hghgjhgjhghjhghgjgjgjhghghghjghgghjghj"),
        PageViewModel(
            decoration: pageDecoration,
            title: "page2",
            image: Image.asset("assets/images/icon3.png"),
            body: "hghgjhgjhghjhghgjgjgjhghghghjghgghjghj"),
        PageViewModel(
            decoration: pageDecoration,
            title: "Page3",
            image: Image.asset("assets/images/icon4.png"),
            body: "hghgjhgjhghjhghgjgjgjhghghghjghgghjghj"),
      ],
      onDone: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SliverExample())),
      onSkip:() => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Carousel())) ,
      showSkipButton: true,
      skip:Text("Skip") ,
      next: Text("next"),
      done: Text("Continue"),
      //globalBackgroundColor: Colors.grey,
      dotsDecorator: const DotsDecorator(
        color: Colors.red,
        activeColor: Colors.blue,
        size: Size(10, 10),
        activeSize: Size(20, 10),


      ),
    );
  }
}
