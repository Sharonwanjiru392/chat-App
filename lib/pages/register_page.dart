import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =TextEditingController();
  //function to navigate to login page
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  //register method
  void register(BuildContext context) async{
    //get auth service
    final _auth = AuthService();

    //if password match then create user
    if (_passwordController.text == _confirmPasswordController.text){
      try{
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text
      );
      }
      catch (e) {
        showDialog
        (context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
          ),
        );
    }
  }
    //if password don't match then show error
    else{
      showDialog(context: context, 
        builder: (context) => const AlertDialog(
          title: Text("password doesn't match"),)
    );
    }
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
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
              "Let's create an account for you!",
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
            const SizedBox(height: 10),
             // confirm password text field
            MyTextfield(
              hintText: "confirm Password",
              obscureText: true,
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 25),
            //Register button
            MyButton(text: "Register", 
            onTap: () => register(context),
            ),
            const SizedBox(height: 25),
            //register now
            Row(
              children: [
                Text(
                  "Aready has an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
