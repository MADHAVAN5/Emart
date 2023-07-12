// import 'package:emart/screens/auth_ui/welcome.dart';
import 'package:emart/screens/auth_ui/welcome.dart';
import 'package:emart/screens/home.dart';
import 'package:flutter/material.dart';

import 'constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emart',
      theme: themeData,
      home: const Home(),
    );
  }
}
