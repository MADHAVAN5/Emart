import 'dart:convert';

import 'package:emart/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/user_model.dart';

class AuthHelper {
  static AuthHelper instance = AuthHelper();

  Future<bool> signUp(String name, String password, String phone, String email,
      BuildContext context) async {
    showLoaderDialog(context);
    UserModel userModel =
        UserModel(phone: phone, name: name, email: email, image: null);
    var res = await http.post(Uri.parse("${authAPI}signup"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userModel.toJson()));
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
    await SessionManager().set("email", email);
    showMessage(resData['message']);
    return resData['status'];
  }
}

void signOut() async {
  await SessionManager().destroy();
}
