import 'dart:convert';

import 'package:salon/repository/repository.dart';
import 'package:http/http.dart ' as http;

import '../model/shop.dart';
import '../model/user.dart';
Future<User>? _futureUser;

class ApiCalls {
  var client = http.Client();

  Future<dynamic> createUser(User user) async {
    var head = ({
      "Accept": "application/json",
      "content-type": "application/json"
    });
    var _payload = jsonEncode(user);
    var Url = Uri.parse(Repository.createuser);
     print(Url);
    http.Response response = await client.post(
        Url, headers: head, body: _payload);
     print('status ok');
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('status ok');
      return User.fromJson(jsonDecode(response.body));
    } else {
      return "";
    }
  }


  Future<dynamic> createShop(Shop shop) async {
    var head = ({
      "Accept": "application/json",
      "content-type": "application/json"
    });
    var _payload = jsonEncode(shop);
    var Url = Uri.parse(Repository.createshop);
    print(Url);
    http.Response response = await client.post(
        Url, headers: head, body: _payload);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("ststus ok");
      return User.fromJson(jsonDecode(response.body));
    } else {
      return "";
    }
  }
}