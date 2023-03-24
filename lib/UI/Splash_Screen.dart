import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:salon/UI/Login_Screen.dart';


import '../main.dart';
import 'firstPage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(75)),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/AppLogo.jpg'),
            )

            
          ),
        ],
      ),
    ),
         backgroundColor: Colors.blueGrey,
         nextScreen: const FirstPage(),
    splashIconSize:250 ,
    );


  }
}
