import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/components/user_tile.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chats/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home page")),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  //buiild a list of users except the current loged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        //return list view
        return ListView(
          children:
              snapshot.data!.map<Widget>((userData) => _buidUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  //build indinvidual user list
  Widget _buidUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    //desplay all users except the current user
   if (userData["email"] != _authService.getCurrentUser()!.email) {
      //return user tile
     return UserTile(
      text: userData["email"],
      onTap: () {
        //navigate to chat page
        Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => ChatPage(
            receiverEmail: userData["email"],
            receiverID: userData["uid"],
          ),
        )
      );
      },
    );
   }else{
    return Container();
   }
  }
}
