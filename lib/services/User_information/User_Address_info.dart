import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../ApiCalls/ApiCalls.dart';
import '../../UI/Home_page.dart';
import '../../UI/profile/User_profile_screen.dart';
import '../../model/user.dart';

class UserAddress extends StatefulWidget {
  var firstName,lastName,mobileNumber,email;
  UserAddress({Key? key,required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.email}) : super(key: key);

  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {

  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final addlineController = TextEditingController();
  final pinController = TextEditingController();
  final LandmarkController = TextEditingController();
  final _formKey =GlobalKey<FormState>();
  bool isClicked = false;
  bool flag=false;
  bool canUpdate(
      Widget UserAdress,
      Widget   Homepage
      ) {
    // TODO: implement canUpdate
    throw UnimplementedError();
  }

  ApiCalls _apiCalls =ApiCalls();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("User Address"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            controller: addlineController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your Address";
                              }
                            },
                            onChanged: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  isClicked = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "address line",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide:
                                  BorderSide(width: 1.2, color: Colors.blue)),
                              hintText: " ",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            controller: LandmarkController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "enter your pin ";
                              }
                            },
                            onChanged: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  isClicked = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Landmark",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide:
                                  BorderSide(width: 1.2, color: Colors.blue)),
                              hintText: "",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            controller: cityController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your city ";
                              }
                            },
                            onChanged: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  isClicked = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "city",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide:
                                  BorderSide(width: 1.2, color: Colors.blue)),
                              hintText: "city",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            controller: stateController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your state ";
                              }
                            },
                            onChanged: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  isClicked = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "state",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide:
                                  BorderSide(width: 1.2, color: Colors.blue)),
                              hintText: "Pincode",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            controller: pinController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your pin ";
                              }
                            },
                            onChanged: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  isClicked = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Enter your pin",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide:
                                  BorderSide(width: 1.2, color: Colors.blue)),
                              hintText: "Enter n",
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {

                              if (_formKey.currentState!.validate()) {
                                setState(() {

                                  isClicked = true;
                                }
                                );
                                print("enter in onpressed");

                              }
                              print(widget.mobileNumber);
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage(uph: widget.mobileNumber)));

                            },

                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    Size(100, 25))),
                            child: Text(
                              "Create",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        (isClicked)
                            ? FutureBuilder(
                          future: _apiCalls.createUser(
                              User(
                                  uph: widget.mobileNumber,
                                  uft: widget.firstName,
                                  ult: widget.lastName,
                                  uemail: widget.email,
                                  uad: UAd(
                                      uadline: addlineController.text,
                                      ucty: cityController.text,
                                      ustate: stateController.text,
                                      upin: pinController.text,
                                      ulandmark: LandmarkController.text))),
                          builder: (context, snapshot) {
                            print(" user data ${snapshot.data}");

                            if (snapshot.hasData) {
                              if (snapshot.data == "") {
                                return Center(
                                    child: Text(
                                      "User With given Id already Present ",
                                      style: TextStyle(color: Colors.red),
                                    ));
                              }
                              return Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name :${snapshot.data["u_fn"]} ${snapshot.data["u_ln"]}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]
                              );
                            } else if (snapshot.hasError) {
                              if (kDebugMode) {
                                debugPrintStack(label: snapshot.error.toString());
                              }
                              return Center(
                                  child: Text("Something Went Wrong"));
                            }
                            return CircularProgressIndicator();
                          },
                        )
                            : Text("heloow my friends")
                      ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


