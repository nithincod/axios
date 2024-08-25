


import 'package:flutter/material.dart';

import '../components/MyTextFeild.dart';
import '../components/Mybutton.dart';
import '../services/auth_service.dart';


class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key, this.OnTap});

  final void Function()? OnTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final TextEditingController EmailController = TextEditingController();
final TextEditingController PassController = TextEditingController();
final TextEditingController ConPassController = TextEditingController();

void SignUp(BuildContext context) async {
  if (PassController.text != ConPassController.text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Passwords not matching"),
      ),
    );
    return;
  }

  AuthService authService = AuthService(); 
  

  try {
    await authService.signupwithemailPassword(
      EmailController.text,
      PassController.text,
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.toString()),
      ),
    );
  }
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  
                  const SizedBox(
                    height: 85,
                  ),
                  const Icon(
                    Icons.message,
                    size: 110,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                  const Text(
                    "Let's create an account for you!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  
                  MyTextField(
                    hinttext: 'Email',
                    unknowntext: false,
                    controller: EmailController, 
                    labeltext: 'Email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  
                  MyTextField(
                    hinttext: 'Password',
                    unknowntext: true,
                    controller: PassController, 
                    labeltext: 'Password',
                  ),
                  
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    hinttext: 'Confirm password',
                    unknowntext: true,
                    controller: ConPassController, 
                    labeltext: 'Confirm password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(ontap: () => SignUp(context), text: "Sign Up"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Signed Up? '),
                      GestureDetector(
                        onTap: widget.OnTap,
                        child: Text(
                          'Login Now',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
