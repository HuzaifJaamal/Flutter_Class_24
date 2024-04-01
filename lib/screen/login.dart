import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_24/screen/home.dart';
import 'package:flutter_class_24/screen/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loadder = false;
  login() async{
    try {

  final credential =
    loadder = true;
    setState(() {});
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
} on FirebaseAuthException catch (e) {
    loadder = false;
    setState(() {});
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: emailController,),
          TextField(controller: passwordController,),
          ElevatedButton(
            onPressed: (){
              login();
            },
            child: const Text("Login"),
            ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
            },
            child: const Text("Already have an account?"),
          ),
          Visibility(visible: loadder, child: CircularProgressIndicator())
        ],
      ),
    );
  }
}