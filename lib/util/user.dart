import 'dart:convert';

import 'package:http/http.dart';

class User {
  final String endpoint = "https://travel-cash.herokuapp.com/user";
  Map<String, String> headers = {"Content-type": "application/json"};
  Future<Map<String, dynamic>> status() async {
    print(headers);
    Response response = await get(endpoint + "/status", headers: headers);
    updateCookie(response);
    return json.decode(response.body);
  }

  Future login(String username, String password) async {
    String body = '{"username":"$username", "password":"$password"}';
    Response response = await post(endpoint+"/login", headers: headers, body: body);
    updateCookie(response);
    return json.decode(response.body);
  }

  Future register(String username, String password, String name, String gender, num age) async {
    String body = '{"username":"$username", "password":"$password", "name": "$name", "gender": "$gender", "age": $age }';
    Response response = await post(endpoint+"/register", headers: headers, body: body);
    updateCookie(response);
    return json.decode(response.body);
  }
  Future travel(String start, String end, num distance, num cash) async {
    String body = '{"start": "$start", "end": "$end", "distance": $distance, "cash": $cash}';
    Response response = await post(endpoint+"/travel", headers: headers, body: body);
    updateCookie(response);
    return json.decode(response.body);
  }
  Future endtravel() async {
    Response response = await get(endpoint + "/endtravel", headers: headers);
    updateCookie(response);
    return json.decode(response.body);
  }

  Future logout() async {
    Response response = await get(endpoint + "/logout", headers: headers);
    updateCookie(response);
    return json.decode(response.body);
  }

  void updateCookie(Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      headers['cookie'] = rawCookie;
    }
  }
}

User userObject = new User();