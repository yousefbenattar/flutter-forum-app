import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constrants.dart';
import 'package:get_storage/get_storage.dart';

import '../views/home.dart';
class AuthenticationController extends GetxController{
  final isloading = false.obs;
  final box = GetStorage();
  final token =''.obs;
  Future register (   {
    required String name ,
    required String username,
    required String email ,
    required String password,
  })
  async {
try {
      isloading.value = true;
    var data = {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
   var response = await http.post(
    Uri.parse(url + 'register'),
    headers: {'Accept':'application/json'},
    body: data,
   );
   if(response.statusCode == 201){
    isloading.value = false;
    token.value = json.decode(response.body)['token'];
    box.write('token', token.value);
    Get.offAll(()=>const Home());
    }
    else {
      isloading.value = false;
      Get.snackbar(
      'error',
      json.decode(response.body)['message'],
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.red
    );
     print(json.decode(response.body));
    }
  
}catch(error){
  isloading.value = false;
  print(error.toString()) ;
}}


  Future login (   {
    required String username ,
    required String password,
  })
  async {
try {
      isloading.value = true;
    var data = {
      'username': username,
      'password': password,
    };
   var response = await http.post(
    Uri.parse(url + 'login'),
    headers: {'Accept':'application/json'},
    body: data,
   );
   if(response.statusCode == 200){
    isloading.value = false;
    token.value = json.decode(response.body)['token'];
    box.write('token', token.value);
    Get.offAll(()=>const Home());
    }
    else {
      isloading.value = false;
      Get.snackbar(
      'error',
      json.decode(response.body)['message'],
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.red
    );
     print(json.decode(response.body));
    }
  
}catch(error){
  isloading.value = false;
  print(error.toString()) ;
}}
}