import 'package:flutter/material.dart';

class Postlist extends StatelessWidget {
  const Postlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10)),
          //height: 150,
          width: double.infinity,
          child:const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Username'),
            Text('Post :bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla'),
          ],),
        ),
        Row(children: [
          IconButton(onPressed: (){}, icon:const Icon(Icons.thumb_up)),
          IconButton(onPressed: (){}, icon:const Icon(Icons.message)),
          ],)
      ],
    );
  }
}

