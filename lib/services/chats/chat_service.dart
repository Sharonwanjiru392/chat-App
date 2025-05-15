// ignore_for_file: unused_import

import 'dart:collection';

import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  //get instance of firestore & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //i will go thought each individual user
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }
  //send message
  Future<void> sendMessage(String receiverID, message) async{
    //get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();


    //create a new message
    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    ); 


    //constract a chat room ID for this two users (sorted to ensure uniqeness)
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); //sort the ids(this will ensure that the chat room ID is always the same for the same two users)
    String chatRoomID = ids.join('_'); //join the ids with an underscore

    //add this new message to the database
    await _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").add(newMessage.toMap());
  }



  //get messages
  Stream<QuerySnapshot> getMessages(String userID, otherUserID)
  {
    //Construct a chat room ID for this two users (sorted to ensure uniqeness)
    List<String> ids = [userID, otherUserID];
    ids.sort(); //sort the ids(this will ensure that the chat room ID is always the same for the same two users)
    String chatRoomID = ids.join('_'); //join the ids with an underscore
    //get messages from the database
    return _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").orderBy("timestamp", descending: false).snapshots();
  }
}
