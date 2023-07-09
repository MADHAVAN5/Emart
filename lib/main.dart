import 'package:emart/auth_ui/welcome.dart';
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
      title: 'Emart',
      theme: themeData,
      home: const Welcome(),
      //  home: StreamBuilder(
      //     stream: FirebaseAuthHelper.instance.getAuthChange,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return const CustomBottomBar();
      //       }
      //       return const Welcome();
      //     },
      //   ),
    );
  }
}
