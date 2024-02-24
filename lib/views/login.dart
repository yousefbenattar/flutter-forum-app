import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/authentecation.dart';
import 'input_widget.dart';
import 'register.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
final AuthenticationController _authenticationController = Get.put(AuthenticationController ());
TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
class _LoginState extends State<Login> {
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
                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),color: Colors.white54),
                  child:const Text('Login Page',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  const SizedBox(height: 15),   
                  Input(
                  controller: _usernameController,
                  obscureText: false,
                  hintText: 'username',),
                  const SizedBox(height: 15),
                  Input(
                  controller: _passwordController,
                  obscureText: true,
                  hintText: 'password',),
                  const SizedBox(height: 15),
                  ElevatedButton(onPressed: () async{
                    await _authenticationController.login(
                     username: _usernameController.text.trim(),
                     password: _passwordController.text.trim()); 
                  },
                   child: Obx(() {
                return _authenticationController.isloading.value
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      );
              })),
                  const SizedBox(height: 15),
                  TextButton(onPressed: (){
                  Get.to(()=>const Register());
                  },
                  child:const Text('Register',style: TextStyle(color: Colors.white),))
                ]),
      ),
    );
  }
}
