import 'package:flutter/material.dart';
import 'package:salon/UI/Login_Screen.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Smart Salon', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Container(
                      child: Container(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/AppLogo.jpg'),
                    ),
                  )),
                  SizedBox(
                      height:5
                  ),
                  Text('Smart Salon',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(
                      height:100
                  ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 120.0, vertical: 10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              primary: Color(0xff201d43)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: Text('Login',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)
                          )
                      ),



                ],
              ),
            ),
          ),
        ));
  }
}
