// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mailing_system/AppViews/add_Contact.dart';
import 'package:mailing_system/AppViews/contacs.dart';
import 'package:mailing_system/AppViews/editProfile_screen.dart';
import 'package:mailing_system/AppViews/inboxPage.dart';
import 'package:mailing_system/AppViews/login_screen.dart';
import 'package:mailing_system/AppViews/mail_Screen.dart';
import 'package:mailing_system/AppViews/profile_screen.dart';
import 'package:mailing_system/AppViews/register_screen.dart';
import 'package:mailing_system/AppViews/sendmessage_screen.dart';
import 'package:mailing_system/SharedMaterial/notificationsFactory.dart';
import 'package:mailing_system/AppViews/splash_screen.dart';
import 'package:mailing_system/SharedMaterial/globals.dart';
import 'SharedMaterial/globals.dart';
import 'dbHelper.dart';

void main() async {
  runApp(MyApp());
}

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
      home: LoginScreen(),
      routes: {
        'contacts': (context) => const Contacts(),
        'sendMessage': (context) => const SendMessage(),
        'login': (context) => const LoginScreen(),
        'register': (context) => RegisterScreen(),
        'mail': (context) => EmailScreen2(),
        'inbox': (context) => inboxPage(),
        'editProfile': (context) => EditProfileScreen(),
        'profile': (context) => ProfileScreen(),
        'send': (context) => SendMessage(),
        'addContact': (context) => AddContacts(),
      },
    );
  }
}
