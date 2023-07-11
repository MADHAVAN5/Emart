import 'dart:convert';

import 'package:emart/config/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class AuthHelper {
  static AuthHelper instance = AuthHelper();

  Future<bool> signUp(String name, String password, String phone, String email,
      BuildContext context) async {
    showLoaderDialog(context);
    var data = {
      "name": name,
      "password": password,
      "phone": phone,
      "email": email
    };
    var res = await http.post(Uri.parse("${authAPI}signup"),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    var resData = jsonDecode(res.body);

    // ignore: use_build_context_synchronously
    Navigator.of(context, rootNavigator: true).pop();
    return resData['status'];
  }

  Future<bool> login(
      String email, String password, BuildContext context) async {
    showLoaderDialog(context);
    var data = {"email": email, "password": password};
    var res = await http.post(Uri.parse("${authAPI}login"),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    var resData = jsonDecode(res.body);

    // ignore: use_build_context_synchronously
    Navigator.of(context, rootNavigator: true).pop();
    showMessage(resData['message']);
    return resData['status'];
  }
}
