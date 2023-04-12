import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:salon/booking/cartmodel.dart';


import 'Booking_info.dart';
class ShopInfo extends StatefulWidget {
  const ShopInfo({Key? key}) : super(key: key);

  @override
  State<ShopInfo> createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> with TickerProviderStateMixin {


  @override



  //  Map<String ,dynamic>menu ={'hair cut':'40'};
  // Map<String ,String>myAppMenu(Map <String ,List<String>>map){
  //   var newMenu=<String ,String>{};
  //   for(var entry in map.entries)
  //     {
  //      List keylist=entry.key as List<String>;
  //       for(var key in keylist)
  //         {
  //          newMenu[key]=entry.value.toString();
  //         }
  //     }
  //   return newMenu;
  // }
  // // var mymap =myAppMenu({"hairCut" :["20","30 min"]});
  // Map<String,dynamic> addlist ={};
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor:  Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(LineAwesomeIcons.angle_left),color: Colors.black,),
        // title: Text('Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CarouselSlider( options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              aspectRatio: 16/9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
              enlargeCenterPage: true,
            ),
                items: _images.map((i) {
                  return Builder(
                      builder: (BuildContext context)
                      {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: AssetImage(i),
                                  fit: BoxFit.cover
                              )
                          ),



                        );
                      }
                  );

                }
                ).toList())  ,
            const Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('RJ Hair & Beauty Salon',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0.8,left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('4.5',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                      Icon(Icons.star,color: Colors.orange),
                      Icon(Icons.star,color: Colors.orange),
                      Icon(Icons.star,color: Colors.orange),
                      Icon(Icons.star,color: Colors.orange),
                      Icon(Icons.star_half,color: Colors.orange),
                    ],
                  ),
                  Icon(Icons.favorite_border)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0.8,left: 10,right: 10),
              child: Row(
                children: [
                  Text('Open',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.call),
                  Icon(Icons.chat),
                  Icon(Icons.directions),
                  Icon(Icons.share),

                ],

              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 5,
              child: Container(
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TabBar(
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 5,
                          color: Colors.blueGrey

                      )
                  ),
                  controller: tabController,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 30),
                  tabs: [
                    Tab(
                      child: Text(
                        "OVERVIEW",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "SERVICES",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "REVIEW",
                        style: TextStyle(color: Colors.black),
                      ),

                    ),
                    Tab(
                      child: Text(
                        "PHOTOES",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(

                height: 530,
                width: 400,

                color: Colors.white,


                child: TabBarView(
                  controller: tabController,

                  children: [
                    //   Icon(Icons.sort ),

                    Column(
                      children: [
                        Container(
                          color: Colors.white54,
                          height: 40,
                          width: double.infinity,
                          child: Center(
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined,color: Colors.blue),
                                SizedBox(

                                  height: 10,
                                  width: 20,
                                ),
                                Text('Open',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green)),
                                SizedBox(
                                  height: 10,
                                  width: 10,
                                ),
                                Text('Closes 9 pm',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Container(
                          color: Colors.white54,
                          height: 40,
                          width: double.infinity,
                          child: Center(
                            child: Row(
                              children: [
                                Icon(Icons.call,color: Colors.blue),
                                SizedBox(

                                  height: 10,
                                  width: 20,
                                ),
                                Text('9158960971',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),

                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.location_on_outlined,color: Colors.blue),

                            SizedBox(

                              height: 10,
                              width: 20,
                            ),
                            Container(
                              // height: 100,
                              // width: 100,
                                child:Text('Sinhgad Campus\nAmbegaon bk pune\n411041 ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                            ),
                            SizedBox(
                              height: 10,
                              width: 20,
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              child: Image(image: AssetImage('assets/images/salon.jpg'),),
                            )

                          ],
                        ),


                        const Divider(

                          thickness: 2,
                        ),

                      ],
                    ),
                    Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Consumer<CartModel>(
                            builder: (context,value,child) {
                              return ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: value.menu.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      elevation: 2,
                                      color: Colors.grey.shade100,
                                      child: ListTile(
                                          title: Text(value.menu[index][0].toString(),style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            fontSize: 20
                                          ),),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text("Price: ${value.menu[index][1]}",style: TextStyle(fontWeight: FontWeight.bold),),
                                                  
                                                ),
                                                SizedBox(width: 50,),
                                                Container(
                                                  child: Text("Time: ${value.menu[index][2]}",style: TextStyle(fontWeight: FontWeight.bold),),
                                                )
                                              ],
                                            ),
                                          ),
                                          trailing: InkWell(child: Icon(
                                            Icons.add_circle_outline_outlined,
                                            color: Colors.lightBlue,
                                          ),
                                            onTap: () {
                                            Provider.of<CartModel>(context,listen:false).addItemToCart(index);
                                            print("added");

                                            },)
                                      ),
                                    );
                                  });
                            }
                          ),
                          Container(
                              width: double.infinity,
                              child: ElevatedButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const bookingInfo()),
                                );

                              }, child: Text('Next'))
                          )
                        ]
                    ),

                    Center(
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('4.3',style: TextStyle(fontSize: 70,color: Colors.grey)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,color: Colors.orange,size: 50),
                                Icon(Icons.star,color: Colors.orange,size: 50),
                                Icon(Icons.star,color: Colors.orange,size: 50),
                                Icon(Icons.star,color: Colors.orange,size: 50),
                                Icon(Icons.star_half,color: Colors.orange,size: 50),
                              ],
                            ),
                          ],
                        )
                    ),
                    GridView.count(crossAxisCount: 2,

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Image.asset('assets/images/1.jpg',fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Image.asset('assets/images/2.jpg',fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Image.asset('assets/images/3.jpg',fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Image.asset('assets/images/4.jpg',fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Image.asset('assets/images/salon.jpg',fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Image.asset('assets/images/AppLogo.jpg',fit: BoxFit.cover),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  final List _images=[
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg'];
}
