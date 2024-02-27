import 'package:flutter/material.dart';
import 'widgets/input_widget.dart';
import 'package:get/get.dart';
import '../controllers/authentecation.dart';
class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}
final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final AuthenticationController _authenticationController = Get.put(AuthenticationController ());
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
                  controller: _nameController,
                  obscureText: false,
                  hintText: 'name',),
                  const SizedBox(height: 15),
                  Input(
                  controller: _usernameController,
                  obscureText: false,
                  hintText: 'username',),
                  const SizedBox(height: 15),
                   Input(
                  controller: _emailController,
                  obscureText: false,
                  hintText: 'email',),
                  const SizedBox(height: 15),
                  Input(
                  controller: _passwordController,
                  obscureText: true,
                  hintText: 'password',),
                  const SizedBox(height: 15),
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(right: 25,left: 25)
                ),
                        onPressed: () async {
                          await _authenticationController.register(
                              name: _nameController.text.trim(),
                              username: _usernameController.text.trim(),
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim());
                        },
                        child: Obx(() {
                return _authenticationController.isloading.value  ? Container(
                  margin : const EdgeInsets.only(right: 50,left: 50),
                  child:const Center(child: CircularProgressIndicator(),),
                ) : const Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 20,color: Colors.black, fontWeight: FontWeight.bold),
                            );
                          }
                        )),
              
                 const SizedBox(height: 15),
                ]),
      ),
    );
  }
}
