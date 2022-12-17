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
void main()=>(runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
      routes:{
        "Inboxpage":(context) => inboxPage(),
        "SendMessage":(context) => const SendMessage(),
        "Contacts":(context) => const Contacts(),
        "ProfileScreen":(context) => const ProfileScreen(),
        "MailScreen":(context) => EmailScreen2(),
        "RegisterScreen":(context) => RegisterScreen(),
        "LoginScreen":(context) => const LoginScreen(),
        "EditProfileScreen":(context) => const EditProfileScreen()
      } ,
    );
  }
}
