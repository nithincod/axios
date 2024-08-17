
import 'package:flutter/material.dart';

import '../components/MyTextFeild.dart';
import '../components/Mybutton.dart';
import '../services/auth_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key, required this.OnTap}) : super(key: key);
  final void Function()? OnTap;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    final AuthService authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
     
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                hinttext: 'Enter your email',
                labeltext: 'Email',
                controller: emailController,
                unknowntext: false,
              ),
              MyTextField(
                hinttext: 'Enter your PASSWORD',
                labeltext: 'PASSWORD',
                controller: passwordController, // Corrected here
                unknowntext: false,
              ),
              SizedBox(height: 60),
              MyButton(ontap: () => login(context), text: "Login"),
              
              TextButton(
                onPressed: OnTap,
                child: const Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}