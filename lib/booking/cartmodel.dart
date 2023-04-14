import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier
{
  //[menuitem , price , menu time]
  final List _menu = [
    ["hair cut -Premier Stylist" ,"150","30 "],
    ["Hair Cut -Top Style","200","45"],
    ["Hair Tattoo","500","45"],
    ["Kids Cut","100","30 "],
    ["Head Massage","100","30 "],
    ["Beard Trim","60","30"],
    ["Beard design","100","30 "],
    ["Hair Wash And Conditioning ","500"," 160"],
    ["Beard -Top Style","203","60"],
  ];

  //list for cart items
  List _cartlist =[];

   get menu => _menu;
   get cartlist => _cartlist;

   //Add items to cart
   void addItemToCart(int index)
   {
     _cartlist.add(_menu[index]);
     notifyListeners();
   }
   // Remove item form Cart
   void removeItemToCart(int index)
   {
     print("enter");
     _cartlist.removeAt(index);
     print("complete");
     notifyListeners();
   }

   // Calculate Total Price Of Cart List
  String TotalPrice()
  {
    double totalprice =0;
    for(int i=0;i<_cartlist.length;i++)
      {
       totalprice +=double.parse(_cartlist[i][1]);
      }
    return totalprice.toString();
  }

  String TotaltimeOfCart()
  {
    double totaltime =0;
    for(int i=0 ;i<_cartlist.length;i++)
      {
        totaltime +=double.parse(_cartlist[i][2]);
      }
    return totaltime.toString();
  }
}