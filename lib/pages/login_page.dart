// ignore_for_file: deprecated_member_use

import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //email password text controller

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //function to navigate to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});
  //login method
  void login(BuildContext context) async {
   //check auth service
   // ignore: unused_local_variable
   final authService = AuthService();
   //try login 
   try{
    await authService.signInWithEmailPassword(_emailController.text,_passwordController.text,);
   }
   //catch error
   catch (e) {
    showDialog(context: context, 
    builder: (context) => AlertDialog(
      title: Text(e.toString()),
    ));
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),
            //welcome back message
            Text(
              "Welcome back, you have been missed!",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 25),

            //email text field
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            //password text field
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 25),
            //login button
            MyButton(text: "Login",
             onTap: () => login(context)),
            const SizedBox(height: 25),
            //register now
            Row(
              children: [
                Text("Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Register now", 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
