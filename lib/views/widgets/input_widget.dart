import 'package:flutter/material.dart';

class Input extends StatelessWidget {
 const Input({super.key,required this.hintText,required this.controller,required this.obscureText});
 final String hintText ;
 final TextEditingController controller ;
 final bool obscureText ; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/8,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(5),
              ),
    child: TextField(
    controller: controller,
    obscureText:obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      border: InputBorder.none
    ),
    ),
    );
  }
}