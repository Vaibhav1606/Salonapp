import 'package:flutter/material.dart';
import 'package:salon/UI/Splash_Screen.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      theme: ThemeData(

        primarySwatch: Colors.indigo,
       // brightness: Brightness.dark
      ),
      home: const SplashScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}):super(key:key);
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//         title: const Text('Home'),
//         centerTitle: true,
//       ),
//     );
//   }
// }
