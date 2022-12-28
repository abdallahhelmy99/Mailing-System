// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:mailing_system/AppViews/add_Contact.dart';
=======
import 'package:mailing_system/AppViews/add_contact.dart';
>>>>>>> 91f89456d880fe90fcf0b86853e9a39e566f936f
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

<<<<<<< HEAD
void main() async {
=======
void main() async{
>>>>>>> 91f89456d880fe90fcf0b86853e9a39e566f936f
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
