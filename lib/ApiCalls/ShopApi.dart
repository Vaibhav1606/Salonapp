import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../model/shop.dart';
import '../repository/repository.dart';

late Shop shop;


class ShopApi
{
  var client = http.Client();

  Future<dynamic> createShop(Shop shop) async {
    var head = ({
      "Accept": "application/json",
      "content-type": "application/json"
    });
    var _payload = jsonEncode(shop);
    var Url = Uri.parse(Repository.createshop);
    print(Url);
    print("name");
    var response = await client.post(
        Url, headers: head, body: _payload);


    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(" ok");

      return  jsonDecode(response.body);
    } else {
      return "";
    }
  }

  Future<List>getAllShop ()
  async {
    List shopdata =[];
    var head = ({"Accept": "application/json", "content-type": "application/json"});
    var Url =Uri.parse(Repository.getAllShop);
    print(Url);
    http.Response response =await client.get(Url);
    var res=jsonDecode(response.body);
    if(response.statusCode ==200)
    {

      //return res.map((job) => new Shop.fromJson(job)).toList();
      for(Map<String,dynamic> i in res)
      {
        shopdata.add(i);

      }
      print(shopdata.length);
    }
    return shopdata;


  }
  Future<dynamic> getOneShop(String shopId) async {

    var Url = Uri.parse(Repository.getOneShop+"/${shopId}");
    print(Url);
    http.Response response = await client.get(Url);
    log("status ok");
    if (response.statusCode == 200 || response.statusCode == 201) {
      log('enter in response');
      return jsonDecode(response.body);

    } else {
      return "";
    }
  }
}