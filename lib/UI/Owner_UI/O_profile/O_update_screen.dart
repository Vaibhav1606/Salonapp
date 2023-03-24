import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'O_profile_screen.dart';

class UpdateOwnerProfileScreen extends StatelessWidget {
  const UpdateOwnerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text('Edit Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(
              children: [
                // -- IMAGE with ICON
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/AppLogo.jpg'),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.indigo),
                        child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                // -- Form Fields
                Form(
                  child: Column(
                    children: [
                      TextFormField(

                        decoration: const InputDecoration(
                            label: Text('Full Name'), prefixIcon: Icon(LineAwesomeIcons.user),
                             enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(
                                   color: Colors.black12,

                                   width: 2
                               ),
                             ),
                             focusedBorder: OutlineInputBorder(

                             borderSide: BorderSide(
                              width: 2, color: Colors.indigo),
                              ),
                        ),
                      ),
                      const SizedBox(height: 50 - 20),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text('Mail'), prefixIcon: Icon(LineAwesomeIcons.envelope_1),
                            enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                        color: Colors.black12,
                            width: 2
                        ),
                      ),
        focusedBorder: OutlineInputBorder(

          borderSide: BorderSide(
              width: 2, color: Colors.indigo),
        ),),
                      ),
                      const SizedBox(height: 50 - 20),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text('phone'), prefixIcon: Icon(LineAwesomeIcons.phone),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black12,
                                width: 2
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(

                            borderSide: BorderSide(
                                width: 2, color: Colors.indigo),
                          ),),
                      ),
                      const SizedBox(height: 50 - 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          label: const Text('pass'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black12,
                                width: 2
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(

                            borderSide: BorderSide(
                                width: 2, color: Colors.indigo),
                          ),
                          prefixIcon: const Icon(Icons.fingerprint),
                          suffixIcon:
                          IconButton(icon: const Icon(LineAwesomeIcons.eye_slash), onPressed: () {}),
                        ),
                      ),
                      const SizedBox(height: 50),

                      // -- Form Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const OwnerProfileScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff201d43),
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: const Text('Update Profile', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
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