import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:salon/UI/personal_info.dart';

import '../services/User_information/Personal_info.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var otp =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Verification Code',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text('We have sent the verification to youe Number',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center),
              SizedBox(
                height: 100,
              ),
          Pinput(
            controller: otp,
            validator: (s) {
              return s == '2222' ? null : 'Pin is incorrect';
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),
              SizedBox(
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
                      //print("button pressed");

                      var Otp=otp.text.toString();
                      if(Otp=='2222')
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Create()),
                          );
                        }
                      else
                        {

                        }

                    },
                    child: Text('Verify Phone Number',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
