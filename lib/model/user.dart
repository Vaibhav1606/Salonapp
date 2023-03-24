import 'dart:convert';
import 'package:http/http.dart' as http;
User userJson(String str)=>
    User.fromJson(json.decode(str));
String userToJson(User data)=>json.encode(data.toJson());

class User {
 late String uph;
  late  String uft;
  late String ult;
  late  String uemail;
  UAd? uad;
  // late String ufav;

  User({ required this.uph, required this.uft, required this.ult,required  this.uemail, required this.uad});

  User.fromJson(Map<String, dynamic> json) {
    uph = json['u_mn'];
    uft = json['u_fn'];
    ult = json['u_ln'];
    uemail = json['u_em'];
    uad = json['u_addr'] != null ? UAd?.fromJson(json['u_ad']) : null;
   // ufav = json['u_fav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['u_mn'] = uph;
    data['u_fn'] = uft;
    data['u_ln'] = ult;
    data['u_em'] = uemail;
    data['u_addr'] = uad!.toJson();

    return data;
  }
}

class UAd {
  late String uadline;
  late String ulandmark;
  late String ucty;
  late String ustate;
  late String upin;

  UAd({ required this.uadline,required  this.ucty,required this.ustate, required this.upin,  required this.ulandmark});

  UAd.fromJson(Map<String, dynamic> json) {
    uadline = json['addressLine'];
    ulandmark =json['landmark'];
    ucty = json['city'];
    ustate = json['state'];
    upin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['addressLine'] = uadline;
    data['landmark'] =ulandmark;
    data['city'] = ucty;
    data['state'] = ustate;
    data['pin'] = upin;
    return data;
  }
}

