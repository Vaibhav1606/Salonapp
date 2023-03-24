import 'dart:convert';

import 'package:http/http.dart' as http;
Shop shopJson(String str)=>
    Shop.fromJson(json.decode(str));
String shopToJson(Shop data)=>json.encode(data.toJson());
//var client = http.Client();
class  Shop {
  late String sp_nm;
  Address? sp_addr;
  late String mobileNumber;

  // late  List<String> sp_pts;  //shop photos
 // Location? sp_loc; //shop map location
  late String sp_rating;
  late String sp_dspn; //shop description
  late String sp_opn_tm;
  late String sp_cls_tm;

  Shop(
      { required this.sp_nm, required this.sp_addr, required this.mobileNumber, required this.sp_dspn, required this.sp_opn_tm, required this.sp_cls_tm});

  factory Shop.fromJson(Map <String, dynamic> json)=>
      Shop(
        sp_nm: json["sp_nm"],
        sp_addr: json["sp_addr"],
        mobileNumber: json["mobileNumber"],
        //  sp_pts:json["sp_pts"],
       // sp_loc: json["sp_loc"],
      //  sp_rating: json["sp_rating"],
        sp_dspn: json["sp_dspn"],
        sp_opn_tm: json["sp_opn_tm"],
        sp_cls_tm: json["sp_cls_tm"],
      );

  Map<String, dynamic> toJson() =>
      {
        "sp_nm": sp_nm,
        "sp_addr": sp_addr,
        "mobileNumber": mobileNumber,
        //"sp_pts":sp_pts,
        //"sp_loc": sp_loc,
      //  "sp_rating": sp_rating,
        "sp_dspn": sp_dspn,
        "sp_opn_tm": sp_opn_tm,
        "sp_cls_tm": sp_cls_tm,

      };
}

 class Location {
  late String latitude;
  late String longitude;

  Location({required this.latitude,required this.longitude});
 Location.fromJson(Map<String ,dynamic>json)
 {
   latitude =json["latitude"];
   longitude=json["longitude"];

 }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;

    return data;
  }

}


  class Address {
    late String addressline;

    late String city;
    late String state;
    late String landmark;
    late String pin;

    Address(
        { required this.addressline, required this.city, required this.state, required this.landmark, required this.pin});

    Address.fromJson(Map<String, dynamic> json) {
      addressline = json['addressline'];
      city = json['city'];
      state = json['state'];
      landmark = json['landmark'];
      pin = json['pin'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = Map<String, dynamic>();
      data['addressline'] = addressline;
      data['city'] = city;
      data['state'] = state;
      data['landmark'] = landmark;
      data['pin'] = pin;
      return data;
    }
  }


