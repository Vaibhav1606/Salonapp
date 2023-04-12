import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../Home_page.dart';

class BookingDone extends StatefulWidget {
  const BookingDone({Key? key}) : super(key: key);

  @override
  State<BookingDone> createState() => _BookingDoneState();
}

class _BookingDoneState extends State<BookingDone> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 150,
                width: 150,
                //decoration: BoxDecoration(borderRadius: BorderRadius.circular(75)),
                child: Center(child: Text('Done',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white)))


            ),
          ),
        ],
      ),
    ),
      backgroundColor: Colors.blueGrey,
      nextScreen:  Homepage(uph: null,),
      splashIconSize:250 ,
    );
  }
}
