import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salon/booking/cartmodel.dart';

import 'booking_done_page.dart';

class bookingInfo extends StatefulWidget {
  const bookingInfo({Key? key}) : super(key: key);

  @override
  State<bookingInfo> createState() => _bookingInfoState();
}

class _bookingInfoState extends State<bookingInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text("My Cart",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),),
              ),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.cartlist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200]),
                          child: ListTile(
                              title: Text(
                                value.cartlist[index][0],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: 20),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Price: ${value.cartlist[index][1]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      child: Text(
                                        "Time: ${value.cartlist[index][2]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              trailing: InkWell(
                                child: Icon(
                                  Icons.cancel_rounded,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemToCart(index);
                                },
                              )),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            "Total Price \n${value.TotalPrice()}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            "Total Time \n${value.TotaltimeOfCart()}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 50,
                          width: 110,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.green.shade100),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingDone()));},
                              child: Text("Book Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
