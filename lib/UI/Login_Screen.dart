import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:salon/UI/OTP_Screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countyCode= TextEditingController();


  @override
  void initState() {
    countyCode.text ="+91";
    super.initState();
  }
  var phone =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
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
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 30,right: 30),
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Phone Verification',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
                Text('you need to login your phone before getting started',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                SizedBox(
                  height: 100,
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
                 height: 55,
                 child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Container(

                          child: TextButton(onPressed: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              // optional. Shows phone code before the country name.
                              onSelect: (Country country) {
                                print('Select country: ${country.phoneCode.toString()}');
                                setState(() {
                                  //countyCode=country.phoneCode;
                                }
                                );

                              },
                            );
                          },
                            child: Text('+91',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                          ),
                        ),


                      Text('|',style: TextStyle(fontSize: 35,color: Colors.black),),
                      Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            controller: phone,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(border: InputBorder.none,hintText: 'Phone',),

                          )),

                    ],
                  ),
                ),
                Container(
                  height: 20,
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
                    String name=phone.text.toString();
                      //  print("button pressed");
                        if(name=='9158960971')
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const OtpScreen()),
                            );
                          }
                        else
                          {

                          }

                        },
                     child: Text('Send Code',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))

                  ),
                ),



              ],
            ),
          ),
        ),
      )
    );
  }
}
