import 'dart:convert';
import 'dart:developer';

import 'package:salon/repository/repository.dart';
import 'package:http/http.dart ' as http;

import '../model/shop.dart';
import '../model/user.dart';
Future<User>? _futureUser;
late User user;
late Shop shop;


class ApiCalls {
  var client = http.Client();



  Future<dynamic>createUser( User user) async {
    var head = ({

      "Accept": "application/json",
      "content-type": "application/json"
    });
    var _payload = jsonEncode(user);
    var Url = Uri.parse(Repository.createuser);
    print(Url);
    http.Response response = await client.post(
        Url, headers: head, body: _payload);
      log("enter in create api");
    if (response.statusCode == 200 || response.statusCode == 201) {
      log("getting response of creating user");
      return User.fromJson(jsonDecode(response.body));
    } else {
      return "";
    }
  }



  Future<dynamic> getOneUser(String uph) async {

    var Url = Uri.parse(Repository.getOne+"/${uph}");
    print(Url);
    http.Response response = await client.get(Url);
    log("enter in  getOneUser api");
    if (response.statusCode == 200 || response.statusCode == 201) {
      log("getting response of getOneUser");
      return jsonDecode(response.body);

    } else {
      return "";
    }
  }


}