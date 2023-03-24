
import 'dart:io';

import 'package:flutter/material.dart';

import '../../ApiCalls/ApiCalls.dart';
import 'User_Address_info.dart';


class Create extends StatefulWidget
{
  const Create({super.key});
  @override
  State<Create> createState() => _CreateState();
}
class _CreateState extends State<Create> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  ApiCalls _apiCalls= ApiCalls();

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffD9FCFC),
          appBar: AppBar(
            title: Text("Create User"), centerTitle: true,
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    padding:  EdgeInsets.fromLTRB(0, 40, 0, 0),
                    width:  double.infinity,
                    decoration:  BoxDecoration (
                      color:   Color(0xffD9FCFC),
                    ),
                    child: Container(
                      width:  360,

                      decoration:  BoxDecoration (
                        borderRadius:  BorderRadius.circular(60),
                        color:  Color(0xffD9FCFC),
                      ),
                      child: Column(
                          children: [
                            SizedBox(height: 20,),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                              child: TextFormField(

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter First Name";
                                  }
                                },
                                controller: firstNameController,

                                decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    //filled: true,
                                    //focusColor: Colors.red,
                                    labelText: "First Name",

                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.elliptical(
                                            5, 5)))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return " Enter last Name";
                                  }
                                },
                                controller: lastNameController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(
                                            10))),
                                    // labelText: "Enter your  Last Name",
                                    hintText: "Last Name",
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.elliptical(
                                            5, 5)))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return " Enter Email ";
                                  }
                                },
                                controller: emailController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(
                                            10))),
                                    labelText: "Email ",
                                    hintText: " Email",
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.elliptical(
                                            5, 5)))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Mobile Number";
                                  }
                                },
                                controller: mobileController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(
                                            10)))
                                    ,
                                    labelText: "Mobile Number ",
                                    hintText: "Moble Number",
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.elliptical(
                                            5, 5)))),
                              ),
                            ),
                            FloatingActionButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserAddress(firstName: firstNameController.text, lastName: lastNameController.text, mobileNumber: mobileController.text, email: emailController.text)));
                            },
                              child: Icon(Icons.arrow_forward_rounded),

                            ),
                          ]
                      ),
                    ),

                  )
              ),
            ),

          ),
        )
    );
  }
}


