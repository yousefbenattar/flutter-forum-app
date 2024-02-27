import 'package:flutter/material.dart';
import 'package:forum_app/constrants.dart';
import 'package:get/get.dart';
import '../controllers/postcontroller.dart';
import '../models/feed_model.dart';
import 'widgets/input_widget.dart';
import 'widgets/posts_data.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key,required this.post});
  final PostModel post;

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final TextEditingController _commentcontroller = TextEditingController();
  final PostController _feedController = Get.put(PostController());
@override
void initState() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
        _feedController.getComments(widget.post.id);
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.post.user!.name!),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            PostData(post: widget.post),
            box,
            SizedBox(
           width: double.infinity, 
            height: 300,
            child: Obx(
              () {
                return _feedController.isLoading.value ? const Center(child: CircularProgressIndicator()) :ListView.builder(
                  itemCount: _feedController.comments.value.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return  ListTile(
                    title: Text(_feedController.comments.value[index].user.name),
                    subtitle: Text(_feedController.comments.value[index].body));
                  });
              }
            ),
            ),
             box,
            SizedBox(
              width: double.infinity,
              child: Input(hintText: 'Write Comment...',controller:_commentcontroller, obscureText: false,)),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () async {
                    await _feedController.createComment(widget.post.id,
                     _commentcontroller.text.trim());
                     _commentcontroller.clear();
                     _feedController.getComments(widget.post.id);
                  }
                , child:const Text('Comment',style: TextStyle(color: Colors.white),)),
              ],
            )
          ],),
        ),
      ),
    );
  }
}