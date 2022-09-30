import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:research_app/models/user.dart';

class UserRepository {
  final _baseUrl = "https://633641838aa85b7c5d2a0980.mockapi.io";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/User'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<User> user = it.map((e) => User.fromJson(e)).toList();
        print(user.length);
        return user;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String name, String email, String password) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/User'),
          body: {"name": name, "email": email, "password": password});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putData(String id, String name, String email, String password) async {
    try {
      final response = await http.put(Uri.parse(_baseUrl + '/User/' + id),
          body: {"name": name, "email": email, "password": password});

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
