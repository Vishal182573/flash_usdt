import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/bottomnavigationbar.dart';

import 'package:my_app/customnavigtion.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.systemPurple,
          
        ),
        home:  LoginScreen(),
      );
    } else {
      return MaterialApp(
        title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        home:  HomePage(),
      );
    }
  }
}
