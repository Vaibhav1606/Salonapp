
import 'package:flutter/material.dart';
import 'package:salon/ApiCalls/ShopApi.dart';

import '../ApiCalls/ApiCalls.dart';
import '../UI/Owner_UI/O_Home_Page.dart';
import '../model/shop.dart';


class Create extends StatefulWidget {
  const Create({super.key});
  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _formKey = GlobalKey<FormState>();
  final shopNameController = TextEditingController();
  final opentimeController = TextEditingController();
  final closetimeController = TextEditingController();
  final mobileController = TextEditingController();
  final addlineController = TextEditingController();
  final landmarkController =TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pinController = TextEditingController();
  final desController = TextEditingController();
  ApiCalls _apiCalls = ApiCalls();
   late Shop shop;
   ShopApi _shopApi  =ShopApi();

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // backgroundColor: Colors.gr,
      appBar: AppBar(
        title: Text("Shop Info"),
        centerTitle: true,



      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Shop Name";
                        }
                      },
                      controller: shopNameController,
                      decoration: InputDecoration(
                          labelText: "Enter Your Shop Name",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(width: 1.2, color: Colors.blue)),
                        hintText: " ",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Mobile Number";
                        }
                      },
                      controller: mobileController,
                      decoration: InputDecoration(

                          labelText: " Enter Your Mobile Number",

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(width: 1.2, color: Colors.blue)),
                        hintText: " ",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      minLines: 1,
                      maxLines: 2,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      controller:addlineController,
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
                        labelText: "Enter address line",

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(width: 1.2, color: Colors.blue)),
                        hintText: " ",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter ";
                        }
                      },
                      controller:landmarkController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(

                          labelText: "Enter user's Mobile Number ",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(width: 1.2, color: Colors.blue)),
                        hintText: " ",
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
                        labelText: "Enter your city",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(width: 1.2, color: Colors.blue)),
                        hintText: "city",
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
                        labelText: "Enter your state",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(width: 1.2, color: Colors.blue)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
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
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(width: 1.2, color: Colors.blue)),
                        hintText: " ",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Shop Open Time";
                        }
                      },
                      controller:opentimeController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Enter Shop Open Time ",

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(width: 1.2, color: Colors.blue)),
                        hintText: " ",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Mobile Number";
                        }
                      },
                      controller:closetimeController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Enter Shop Close Time ",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(width: 1.2, color: Colors.blue)),
                        hintText: " ",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      minLines: 1,
                      maxLines: 6,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Shop Description";
                        }
                      },
                      controller:desController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(

                          labelText: "Enter Shop Description ",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(width: 1.2, color: Colors.blue)),
                        hintText: " ",
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isClicked = true;
                          });
                        }
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Owner(shopId:null ,)),
                              );

                      },
                      style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          fixedSize:
                          MaterialStateProperty.all<Size>(Size(100, 25))),
                      child: Text(
                        "Create",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  (isClicked)
                      ? FutureBuilder(
                    future: _shopApi.createShop(Shop(
                        sp_nm :shopNameController.text,
                        mobileNumber : mobileController.text,
                        sp_addr: Address(
                            addressline: addlineController.text,
                            landmark: landmarkController.text,
                            city: cityController.text,
                            state: stateController.text,
                            pin: pinController.text),
                            sp_opn_tm: opentimeController.text,
                            sp_cls_tm: closetimeController.text,
                             sp_dspn: desController.text,
                              ),
                    ),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      Map<String ,dynamic > map =snapshot.data;
                      if (snapshot.hasData) {

                        if (snapshot.data == "") {
                          return Center(
                              child: Text(
                                " you are already Present ",
                                style: TextStyle(color: Colors.red),
                              ));
                        }


                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Name : ${map["sp_nm"]} ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("Register Successfully"),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(
                            child: Text("Something Went Wrong"));
                      }
                      return CircularProgressIndicator();
                    },
                  )
                      : Text("")
                ],
              )),
        ),
      ),
    );
  }
}
