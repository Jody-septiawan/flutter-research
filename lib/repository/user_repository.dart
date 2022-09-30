import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:research_app/models/user.dart';

class UserRepository {
  final _baseUrl = "https://633641838aa85b7c5d2a0980.mockapi.io/User";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

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
}
