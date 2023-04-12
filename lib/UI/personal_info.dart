import 'package:flutter/material.dart';
import 'package:salon/UI/Home_page.dart';


    class Personalinfo extends StatefulWidget {
      const Personalinfo({Key? key}) : super(key: key);

      @override
      State<Personalinfo> createState() => _PersonalinfoState();
    }

    class _PersonalinfoState extends State<Personalinfo> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(

          backgroundColor: Colors.blueGrey,
          //extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Personal Information', style: TextStyle(color: Colors.white)),
           //elevation: 0,
            leading: IconButton(
               onPressed: (){
                 Navigator.pop(context);
              },
               icon: Icon(
                Icons.arrow_back,
                 color: Colors.black,
               ),
             ),

          ),
          body: SingleChildScrollView(
            child: Container(
               // margin: EdgeInsets.only(top: 100),
              child: Center(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //margin: EdgeInsets.only(left: 30,right: 30),
                        width: double.infinity,
                        child: TextField(

                          decoration: InputDecoration(
                              hintText: 'Enter first name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: 2
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: Colors.grey
                                )

                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //margin: EdgeInsets.only(left: 30,right: 30),
                        width: double.infinity,
                        child: TextField(

                          decoration: InputDecoration(
                            hintText: 'Enter middle name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: 2
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: Colors.grey
                                )

                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //margin: EdgeInsets.only(left: 30,right: 30),
                        width: double.infinity,
                        child: TextField(

                          decoration: InputDecoration(
                            hintText: 'Enter last name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: 2
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: Colors.grey
                                )

                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //margin: EdgeInsets.only(left: 30,right: 30),
                        width: double.infinity,
                        child: TextField(

                          decoration: InputDecoration(
                            hintText: 'Enter address name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: 2
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: Colors.grey
                                )

                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //margin: EdgeInsets.only(left: 30,right: 30),
                        width: double.infinity,
                        child: TextField(

                          decoration: InputDecoration(
                            hintText: 'Enter your E-mail',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: 2
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: Colors.grey
                                )

                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      //width: double.infinity,
                      child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            primary: Color(0xff201d43),
                          ),

                          onPressed: ()
                          {
                            print("button pressed");
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const Homepage(uph: ,)),
                            // );

                          },
                          child: Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        );
      }
    }
