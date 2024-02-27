import 'package:flutter/material.dart';
import 'package:forum_app/controllers/postcontroller.dart';
import 'package:get/get.dart';
import '../constrants.dart';
import 'widgets/postfield.dart';
import 'widgets/posts_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
final PostController _feedController = Get.put(PostController());
final TextEditingController _textcontroller = TextEditingController();
 /* @override
  void initState() {
    _feedController.getAllPosts();
    super.initState();
  }*/
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
                onPressed: () async {
                await  _feedController.createPost(content: _textcontroller.text.trim());
                _textcontroller.clear();
                _feedController.getAllPosts();
                },
                child:Obx(
             () {
                    return _feedController.isLoading.value ? const CircularProgressIndicator(): const Text('Post',style: TextStyle(color: Colors.white),);
                  }
                )),
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
              Obx(
                () {
                   return _feedController.isLoading.value ? const CircularProgressIndicator():
                  ListView.builder(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemCount: _feedController.posts.value.length,
                    itemBuilder: ((context, index) {
                    return PostData(
                      post: _feedController.posts.value[index],
                    );
                  }));
                 }
               ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}

