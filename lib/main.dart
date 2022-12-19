import 'package:flutter/material.dart';
import 'package:mailing_system/AppViews/contacs.dart';
import 'package:mailing_system/AppViews/editProfile_screen.dart';
import 'package:mailing_system/AppViews/inboxPage.dart';
import 'package:mailing_system/AppViews/login_screen.dart';
import 'package:mailing_system/AppViews/mail_Screen.dart';
import 'package:mailing_system/AppViews/profile_screen.dart';
import 'package:mailing_system/AppViews/register_screen.dart';
import 'package:mailing_system/AppViews/sendmessage_screen.dart';
import 'package:mailing_system/AppViews/splash_screen.dart';

import 'dbHelper.dart';

void main() => (runApp(MyApp()));

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< HEAD
      home: LoginScreen(),
=======
      home: Splash(),
      routes: {
        'contacts': (context) => const Contacts(),
        'profile': (context) => const ProfileScreen(),
        'editProfile': (context) => const EditProfileScreen(),
        'inbox': (context) => inboxPage(),
        'sendMessage': (context) => const SendMessage(),
        'login': (context) => const LoginScreen(),
        'register': (context) => RegisterScreen(),
        'mail': (context) => EmailScreen2(),
      },
>>>>>>> fa82aa939f709acf4c013dec25de33072c3a5b7b
    );
  }
}
