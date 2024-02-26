import 'package:flutter/material.dart';

class PostField extends StatelessWidget {
  const PostField({
    super.key,
    required this.hinttext,
    required this.qcontroller
  });
final String hinttext ;
final TextEditingController qcontroller ;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 85,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12),
      child: TextField(
        controller: qcontroller,
        decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        hintFadeDuration: Duration(milliseconds: 500),
        hintText: hinttext,
        border: InputBorder.none
      ),),
    );
  }
}