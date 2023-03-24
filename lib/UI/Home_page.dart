import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:salon/UI/profile/User_profile_screen.dart';

import 'Shop_Display_pages/one_shop_info.dart';
import 'firstPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color(0xffD9FCFC),
        //extendBodyBehindAppBar: true,
        bottomNavigationBar: Container(
          color: Color(0xff201d43),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              gap: 8,
              onTabChange: (value) {
                if(value==3)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  }
              },
              backgroundColor: Color(0xff201d43),
              color: Colors.white54,
              activeColor:Colors.white ,
              tabBackgroundColor: Colors.grey,
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(icon: Icons.home,
                text: 'Home',),
                GButton(icon: Icons.sort,
                text: 'Sort'),
                GButton(icon: Icons.favorite_border,
                text:'fav'),
                GButton(icon: Icons.account_circle_outlined,
                text:'Profile'),
              ],
            ),
          ),
        ),

        appBar: AppBar(
          backgroundColor: Color(0xff201d43),
          automaticallyImplyLeading: false,
         // elevation: 0,
           title:  Padding(
             padding: const EdgeInsets.only(top: 1,bottom: 1,left: 0.5),
             child: ListTile(
                 minVerticalPadding:15.0,
                leading: InkWell(
                  onTap: ()
                  {
                  },
                  child:  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.tealAccent,

                    child: CircleAvatar(
                      radius:25 ,
                      backgroundImage: AssetImage('assets/images/AppLogo.jpg'),
                    ),
                  ) ,
                ),
                title:Text('Ajit Jadhav',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white) ),
                subtitle: Text("location",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
              //  trailing: Text('',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),


              ),
           )
        ),
       body:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  height: 50,
                  //margin: EdgeInsets.only(left: 30,right: 30),
                  width: double.infinity,
                  child: TextField(

                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
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
              Divider(
                thickness: 2,
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                    itemBuilder: (context,index)
                  {

                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ShopInfo()),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading:CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/images/AppLogo.jpg'),
                          ),
                          title:Text('Shop Name' ),
                          subtitle: Text('Location'),
                          trailing: Text('Status'),
                          focusColor: Colors.black,


                        ),
                      ),
                    );

                  },
                    itemCount: 20,
                    // separatorBuilder: (context,index){
                    //   return Divider(height: 50,thickness: 10,);


                  ),
                ),
              )

            ],
          ),


      ),
    );
  }
}
