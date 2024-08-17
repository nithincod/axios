import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {

    try {
        UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
           email: email,
           password: password,
        );
        _fireStore.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'password': password,
        });
        return userCredential;
        
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }

  

  }

  Future<UserCredential> signupwithemailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      //after creating the user, create a new document for the user in the users collection
      await _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
