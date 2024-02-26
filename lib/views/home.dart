import 'package:flutter/material.dart';
import 'package:forum_app/controllers/feedController.dart';
import 'package:get/get.dart';
import '../constrants.dart';
import 'postfield.dart';
import 'posts_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
final FeedController _feedController = Get.put(FeedController());
final TextEditingController _textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title:const Text('Forum App'),),
        body:Container(
          padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              PostField(hinttext: '',qcontroller: _textcontroller),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: Colors.black
                ),
                onPressed: (){}, child:const Text('Post',style: TextStyle(color: Colors.white),)),
                box,
               const SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text("Post's",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                    ],
                  ),
                ),
                box,
               const Postlist(),
               const Postlist(),
               const Postlist(),
            ],
            ),
          ),
        ),
      ),
    );
  }
}

