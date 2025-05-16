import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    //light vs dark mode for correct bubble color

    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser 
        ? (isDarkMode ? Colors.blue :  Colors.grey.shade800)
        : (isDarkMode ? Colors.grey.shade800: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text
      (message, 
      style: TextStyle(color: isCurrentUser ? Colors.white 
      : isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }
}