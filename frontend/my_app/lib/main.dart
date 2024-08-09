import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/bottomnavigationbar.dart';
import 'package:my_app/provider/authprovider.dart';
import 'package:provider/provider.dart';
import 'package:my_app/login_screen.dart';
import 'package:my_app/create_account.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>authprovider()),
        // Add more providers here if needed
      ],
      child: Platform.isIOS
          ? CupertinoApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: const CupertinoThemeData(
              
                primaryColor: CupertinoColors.systemPurple,
              ),
              home: LoginScreen(),
            )
          : MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                fontFamily: 'Poppins'
              ),
              home: LoginScreen(),
            ),
    );
  }
}
