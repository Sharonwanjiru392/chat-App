// ignore: unused_import
import 'package:chat_app/auth/auth_gate.dart';
// ignore: unused_import
import 'package:chat_app/auth/login_or_register.dart';
import 'package:chat_app/firebase_options.dart';
// ignore: unused_import
import 'package:chat_app/pages/login_page.dart';
// ignore: unused_import
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: LightMode,
    );
  }
}