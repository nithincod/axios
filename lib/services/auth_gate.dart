
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/MyHomepage.dart';
import '../pages/loginorregister.dart';

class Authgate extends StatelessWidget {
  const Authgate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
           if (snapshot.hasData){
             return MyHomepage();
           }
           else {
             return LoginOrRegister();
           }
      }
      ),
    );
  }
}