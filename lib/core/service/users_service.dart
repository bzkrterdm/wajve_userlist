import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_list/core/model/users_response.dart';

class UsersService {
  static const String usersAPI = "https://gorest.co.in/public/v1/users?page=";

  static Future<UsersResponse> getUsers(int pageKey) async {
    var response = await http.get(Uri.parse(usersAPI + pageKey.toString()));
    Map<String, dynamic> decodedJson = jsonDecode(response.body);
    UsersResponse usersResponse = UsersResponse.fromJson(decodedJson);
    return usersResponse;
  }
}
