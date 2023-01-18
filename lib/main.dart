import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listnbuy/Auth/login_screen.dart';
import 'package:listnbuy/Controller/register_controller.dart';
import 'package:listnbuy/services/init.dart';

void main() async {
  await initData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ListNBuy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
