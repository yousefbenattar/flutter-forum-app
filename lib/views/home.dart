import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final box = GetStorage();
  late var token = box.read('token');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(token),
    );
  }
}