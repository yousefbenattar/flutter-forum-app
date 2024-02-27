import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'views/home.dart';
import 'views/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final token = box.read('token');
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: token == null ? const Login() : const Home()
    );
  }
}
