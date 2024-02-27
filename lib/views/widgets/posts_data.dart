import 'package:flutter/material.dart';
import 'package:forum_app/controllers/postcontroller.dart';
import 'package:forum_app/views/post_detail.dart';
import 'package:get/get.dart';

import '../../models/feed_model.dart';

class PostData extends StatefulWidget {
  const PostData({
    super.key,
    required this.post,
  });
  final PostModel post;

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  final PostController _feedController = Get.put(PostController());
  Color likecolor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(10)),
          //height: 150,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.post.user!.name!),
              Text(widget.post.content!),
            ],
          ),
        ),
        Row(
          children: [
             IconButton(
                onPressed: () async {
                  await _feedController.likeAndDislike(widget.post.id);
                  _feedController.getAllPosts();
                },
                icon: Icon(
                  Icons.thumb_up,
                  color: widget.post.liked! ? Colors.blue : Colors.black,
                ),
              ),
            IconButton(
                onPressed: () {
                  Get.to(() => PostDetail(
                        post: widget.post,
                      ));
                },
                icon: const Icon(Icons.message)),
          ],
        )
      ],
    );
  }
}
