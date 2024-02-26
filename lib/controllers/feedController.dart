import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../constrants.dart';
class FeedController extends GetxController {
  final posts = [].obs;
  final isLoading = false.obs;
  final box= GetStorage();
  @override
  void onInit() {
    getAllPosts ();
    super.onInit();
  }
  Future getAllPosts () async {
    try{
      var response = await http.get(Uri.parse('${url}feeds'),
        headers:{
          'Accept' :'application/json',
          'Authorization' :'Bearer ${box.read('token')}'
        }
      );
      if(response.statusCode==200){
       print(json.decode(response.body));
      }
      else{
        print(json.decode(response.body));
      }
    }
    catch(e){
      print(e.toString());
    }
  }
}