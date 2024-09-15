import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internshala_by_faizan/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InternshalaDemo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true),
      home: SplashScreen(),
    );
  }
}
