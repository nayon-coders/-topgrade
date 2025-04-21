import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/main.dart';
import 'package:kuwait_elearing/utility/app_const.dart';
class ApiServer{
  //without token
  static Future<http.Response> withoutTokenGetApi({required String url})async{
    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept" : "application/json"
        }
    );
    print("withoutTokenGetApi URL: ${url}");
    print("withoutTokenGetApi status code: ${response.statusCode}");
    print("withoutTokenGetApi body: ${response.body}");
   return response;
  }


  //with token
  static Future<http.Response> getApi({required String url})async{
    print("sharedPreferences!.getString(AppConst.TOKEN)! ---- ${sharedPreferences!.getString(AppConst.TOKEN)!}");
    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept" : "application/json",
          "Authorization" : "Bearer ${sharedPreferences!.getString(AppConst.TOKEN)!}"
        }
    );
    print("GET API STATUS CODE ---- ${response.statusCode}");
    print("GET API BODY ---- ${response.body}");
    return response;
  }

  //without post
  static Future<http.Response> withoutPostApi({required String url, Map<String, dynamic>? body,})async{
     var response = await http.post(Uri.parse(url),
        body: body,
        headers: {
          "Accept" : "application/json",
        }
    );
     print("WITHOUT POST API STATU SCODE = ${response.statusCode}");
     print("WITHOUT POST API RESPONSE = ${response.body}");
     return response;
  }

  // with token post
  static Future<http.Response> postApi({required String url, Map<String, dynamic>? body})async{
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(body),
        headers: {
        //  "Accept" : "application/json",
          "Content-Type" : "application/json",
          "Authorization" : "Bearer ${sharedPreferences!.getString(AppConst.TOKEN)!}"
        }
    );
    print("POST API URL ----- ${url}");
    print("POST API STATUS CODE ----- ${response.statusCode}");
    print("POST API BODY ----- ${response.body}");
    return response;
  }


  // with token post
  static Future<http.Response> putApi({required String url, Map<String, dynamic>? body, String? token})async{
    var response = await http.put(Uri.parse(url),
        body: body,
        headers: {
          "Accept" : "application/json",
          "Authorization" : "Bearer ${sharedPreferences!.getString(AppConst.TOKEN)!}"
        }
    );
    print("PUT API URL ----- ${url}");
    print("PUT API STATUS CODE ----- ${response.statusCode}");
    print("PUT API BODY ----- ${response.body}");
    return response;
  }
  // with token post
  static Future<http.Response> deleteApi({required String url})async{
    var response = await http.delete(Uri.parse(url),
        headers: {
          "Accept" : "application/json",
          "Authorization" : "Bearer ${sharedPreferences!.getString(AppConst.TOKEN)!}"
        }
    );
    print("DELETE API URL ----- ${url}");
    print("DELETE API STATUS CODE ----- ${response.statusCode}");
    print("DELETE API BODY ----- ${response.body}");
    return response;
  }


}