import 'dart:convert';

import 'package:http/http.dart';

class User {
  final String endpoint = "https://apple.com";
  
  Future status() async {
    Response response = await get(endpoint + "/status");
    return json.decode(response.body);
  }

  Future login(String username, String password) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"username":"$username", "password":"$password"}';
    Response response = await post(endpoint+"/login", headers: headers, body: body);
    return json.decode(response.body);
  }

  Future register(String username, String password, String name, String gender, num age) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"username":"$username", "password":"$password", "name": "$name", "gender": "$gender", "age": $age }';
    Response response = await post(endpoint+"/register", headers: headers, body: body);
    return json.decode(response.body);
  }

  Future logout() async {
    Response response = await get(endpoint + "/logout");
    return json.decode(response.body);
  }
}