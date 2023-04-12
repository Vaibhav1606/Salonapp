import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:salon/ApiCalls/ApiCalls.dart';
import 'package:salon/UI/profile/User_profile_screen.dart';

import 'Shop_Display_pages/one_shop_info.dart';
import 'firstPage.dart';

class Homepage extends StatefulWidget {
  var uph;
 Homepage({Key? key,required this.uph}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ApiCalls _apiCalls =ApiCalls();
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
           title:  Stack(
             children:[ Padding(
               padding: const EdgeInsets.only(top: 1,bottom: 1,left: 0.5),
               child:
               FutureBuilder<dynamic>(
                   future: _apiCalls.getOneUser(widget.uph),
                   builder:(context ,snapshot){

                     Map< String,dynamic> map =snapshot.data;

                     if(snapshot.hasData)
                     {
                       return ListTile(
                         leading: CircleAvatar(
                           radius: 28,
                           backgroundColor: Colors.teal,
                           child: CircleAvatar(
                             radius: 25,
                             backgroundImage: AssetImage('assets/images/AppLogo.jpg'),),
                         ),

                         title: Text("${map["u_fn"]} ${map["u_ln"]}",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                         subtitle: Text(map["u_mn"],style: TextStyle(color: Colors.white),),
                       );
                     }
                     else
                     {
                       return Text(snapshot.error.toString());
                     }


                   }

               ),
             ),
        ]
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
                    child: FutureBuilder(
                      future: _apiCalls.getAllShop(),
                      builder: (context,snapshot) {

                        return Card(
                        margin: EdgeInsets.symmetric(
                        horizontal: 5, vertical: 5),
                          child:ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, i){

                              return  Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/salon.jpg'),
                                  ),
                                  title: Text(snapshot.data![i]["sp_nm"].toString()),
                                  subtitle: Text(snapshot.data![i]["sp_act_sts"].toString()),
                                  trailing: Text('30 min'),
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const ShopInfo()),
                                    );

                                  },
                                ),

                              );
                            }),


    );
    }
                        ),
                      ),




              ],
            ),



      ),
    );
  }
}
