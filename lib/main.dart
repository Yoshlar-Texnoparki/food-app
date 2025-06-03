import 'package:flutter/material.dart';
import 'package:food_app/src/ui/auth/login_screen.dart';
import 'package:food_app/src/ui/auth/register_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
