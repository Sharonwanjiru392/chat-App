import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //instant of Auth

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //sign in
  Future<UserCredential?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
     throw Exception(e.code);
    }
  }
  //sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password)async{
    try{
      //create user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //save user info in a separate docs
      return userCredential;
    } on FirebaseAuthException catch (e) 
    {
      throw Exception(e.code);
    }
  }
  //signout
  Future<void> signOut() async{
    return await _auth.signOut();
  }
  //errors
}