import 'package:flutter/material.dart';
import 'input_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.amber,
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Container(padding:const EdgeInsets.only(top: 15, bottom: 15, right: 35, left: 35),
                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),color: Colors.white70),
                  child:const Text('Register Page',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  const SizedBox(height: 15),   
                  Input(
                  controller: _usernameController,
                  obscureText: false,
                  hintText: 'email',),
                  const SizedBox(height: 15),
                  Input(
                  controller: _passwordController,
                  obscureText: true,
                  hintText: 'password',),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap:(){},
                    child: Container(padding:const EdgeInsets.only(top: 15, bottom: 15, right: 35, left: 35),
                    decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),color: Colors.white),
                    child:const Text('Register',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),),
                 const SizedBox(height: 15),
                 

                ]),
      ),
    );
  }
}
