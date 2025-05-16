import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text("settings"),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(14),
        ),
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //dark mode
            const Text("dark mode"),
            //switch toggle
            CupertinoSwitch(value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, 
            onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),)
        
          ],
        ),
      ),
    );
  }
}