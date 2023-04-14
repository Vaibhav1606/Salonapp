import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:salon/ApiCalls/ShopApi.dart';

import '../Shop_Display_pages/one_shop_info.dart';
import '../profile/User_profile_screen.dart';
import 'O_profile/O_profile_screen.dart';

class Owner extends StatefulWidget {
  var shopId;
   Owner({Key? key,required this.shopId}) : super(key: key);

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> with TickerProviderStateMixin {
  ShopApi _shopApi =ShopApi();
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(

        backgroundColor: Color(0xffD9FCFC),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: Container(
          color: Color(0xff201d43),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              gap: 8,
              onTabChange: (value) {
                if (value == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Owner(shopId: widget.shopId,)),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>OwnerProfileScreen ()),
                  );
                }
              },
              backgroundColor: Color(0xff201d43),
              color: Colors.white54,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey,
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.calendar_month_outlined,
                  text: 'Appoinments',
                ),
                GButton(icon: Icons.sort, text: ''),
                GButton(icon: Icons.account_circle_outlined, text: 'Profile'),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: _shopApi.getOneShop(widget.shopId),
              builder: (context,snapshot) {
                return ListTile(
                  //mainAxisAlignment: MainAxisAlignment.start,

                  leading:
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.tealAccent,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/salon.jpg'),
                    ),
                  ),
                  title: Text("Salon Name", style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    //letterSpacing: 1,
                  ),),
                  trailing: Text("stutus", style: TextStyle(
                    color: CupertinoColors.lightBackgroundGray,
                  ),),

                );
              }
            ),

            const Divider(
              thickness: 10,
              color:Color(0xffD9FCFC) ,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  indicator: BoxDecoration(

                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange,
                  ),
                  controller: tabController,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 30),
                  tabs: [
                    Tab(
                      child: Text(
                        "Current\nAppointment",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Completed\nAppointment",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Cancelled\nAppointment",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 530,
              width: 400,

              color: Color(0xffD9FCFC),


              child: TabBarView(
                controller: tabController,
                children: [
                  //   Icon(Icons.sort ),
                  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/salon.jpg'),
                            ),
                            title: Text('Ajit Jadhav'),
                            subtitle: Text('in process'),
                            trailing: Text('30 min'),
                          ),
                        );
                      }),
                  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/salon.jpg'),
                            ),
                            title: Text('Amit Jadhav'),
                            subtitle: Text('Appointment Completed'),
                            trailing: Text('30 min'),
                          ),
                        );
                      }),
                  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/salon.jpg'),
                            ),
                            title: Text('Amit Jadhav'),
                            subtitle: Text('Appoinment Cancelled'),
                            trailing: Text('30 min'),
                          ),
                        );
                      })
                ],
              ),
            ),

          ],
        ),
      ),
    );



  }
}
