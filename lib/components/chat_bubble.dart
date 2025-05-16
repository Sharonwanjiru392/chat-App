import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  //message data
  final String message;
  final bool isCurrentUser;


  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.blue : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(message, style: TextStyle(color: Colors.white)),
    );
  }
}