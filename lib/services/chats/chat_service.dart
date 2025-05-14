// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //get user steam
  /*

Stream<List<Map<String,dynamic> =
this is an example of a list of maps
  [
  {
  'email':
{
'email': test@gmail.com,
'id': 123456789,
'password': test1234,

'email': test@gmail.com,
'id': 123456789,
'password': test1234,
}
]
   */
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //i will go thought each individual user
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }
  //send message

  //get messages
}
