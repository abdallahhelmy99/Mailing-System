import 'package:flutter/material.dart';
import 'package:mailing_system/AppViews/contacs.dart';
import 'package:mailing_system/AppViews/inboxPage.dart';
import 'package:mailing_system/AppViews/login_screen.dart';
import 'package:mailing_system/AppViews/mail_Screen.dart';
import 'package:mailing_system/AppViews/mail_Screen2.dart';
import 'package:mailing_system/AppViews/register_screen.dart';
import 'package:mailing_system/AppViews/sendmessage_screen.dart';
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
      home: inboxPage(),
    );
  }
}
