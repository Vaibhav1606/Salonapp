import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:salon/ApiCalls/ApiCalls.dart';
import 'package:salon/ApiCalls/ShopApi.dart';
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
  ShopApi _shopApi =ShopApi();
  final GlobalKey<LiquidPullToRefreshState> _globalKey =new GlobalKey<LiquidPullToRefreshState>();
  List shopdata =[];
  late Future <List> _future;

  Future<List>_handle ()
  async
  {
    shopdata = await _shopApi.getAllShop() as List;
    print("shopdata ${shopdata}");
    setState(()=>this.shopdata= shopdata);
    return shopdata;


  }


  @override
  void initState() {
    _handle();
    // _future =_apiCalls.getAllShop();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          //backgroundColor: Color(0xff201d43),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,

           title:  Stack(
             children:[ Padding(
               padding: const EdgeInsets.only(top: 1,bottom: 1,left: 0.5),
               child:
               FutureBuilder(
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

                         title: Text("${map["u_fn"]} ${map["u_ln"]}",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
                         subtitle: Text(snapshot.data["u_mn"],style: TextStyle(color: Colors.black),),
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


                   SingleChildScrollView(
                     child: LiquidPullToRefresh(
                       color: Colors.deepPurpleAccent[200],
                       height: 100,
                       animSpeedFactor: 2,
                       showChildOpacityTransition:false,

                       onRefresh:(){
                         setState(() {

                         });
                         return _handle();

                       },
                       child: Container(
                             height: 558,
                             child: FutureBuilder(
                               future: _shopApi.getAllShop(),
                               builder: (context,snapshot) {

                                 return Card(
                                   color: Colors.tealAccent.shade100,
                                 margin: EdgeInsets.symmetric(
                                 horizontal: 5, vertical: 5),
                                   child:ListView.builder(
                                     physics: BouncingScrollPhysics(),
                                     shrinkWrap: true,
                                     itemCount: snapshot.data!.length,
                                     itemBuilder: (context, i){

                                       return  Card(
                                         margin: EdgeInsets.symmetric(
                                             horizontal: 20, vertical: 10),
                                         color: Colors.grey.shade100,
                                         child: ListTile(
                                           leading: CircleAvatar(
                                             backgroundImage: AssetImage('assets/images/salon.jpg'),
                                           ),
                                           title: Text(snapshot.data![i]["sp_nm"].toString()),
                                           subtitle: Text(snapshot.data![i]["sp_act_sts"].toString()),
                                           trailing: Text('30 min'),
                                           onTap: (){
                                             print(snapshot.data![i]["sp_id"]);
                                             Navigator.push(
                                               context,
                                               MaterialPageRoute(builder: (context) =>  ShopInfo(shopId: snapshot.data![i]["sp_id"],)),
                                             );

                                           },
                                         ),

                                       );
                                     }),


    );
    }
                                 ),
                           ),
                     ),
                   ),





                  ],
                ),




      ),
    );
  }
}
