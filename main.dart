import 'package:flutter/material.dart';
import 'package:flutter_login/login/my_login.dart';
import 'package:flutter_login/login/my_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trang Đăng nhập',
      home: MyLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}
