// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mailing_system/SharedMaterial/shared_colors.dart';
import 'package:mailing_system/SharedMaterial/shared_icons.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';
import 'package:mailing_system/SharedMaterial/globals.dart';

import '../Classes/Mail.dart';

class EmailScreen2 extends StatelessWidget {
   EmailScreen2({super.key, required this.mail});

  // Declare a field that holds the mail.
  final Mail mail;
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    SharedWidgets obj = SharedWidgets();
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: obj.appBar(
        90.0,
        Text(''),
        [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: width / 2,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.drafts_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.flag_outlined,
              color: Colors.amber,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_outline,
                color: Colors.redAccent,
              )),
        ],
        null,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(left: width)),
              CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.png') ,
                  radius: 55,
                  backgroundColor: Color.fromARGB(255, 239, 239, 239)),
              SizedBox(
                height: height / 64,
              ),
              Container(
                child: Text(
                  '${returnName(mail.senderID!)}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                      fontFamily: "Singa"),
                ),
              ),
              SizedBox(
                height: height / 128,
              ),
              Text(
                "${mail.date}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(
            height: height / 32,
          ),
          Divider(
            color: Colors.grey,
            indent: width / 8,
            endIndent: width / 8,
          ),
          SizedBox(
            height: height / 128,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: width / 25),
                  child: Container(
                    width: width / 2,
                    child: Text(
                      'Subject: ${mail.subject}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: "SourceSansPro",
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                width: width / 3,
              ),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.attach_file,
                    color: Colors.redAccent,
                  )),
            ],
          ),
          // SizedBox(
          //   height: height / 64,
          // ),
          Divider(
            color: Colors.grey,
            indent: width / 8,
            endIndent: width / 8,
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Text(
                    '${mail.body}',
                    style: TextStyle(fontSize: 18, fontFamily: "SourceSansPro"),
                  ),
                )),
          )
        ],
      ),
      bottomSheet:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.reply_outlined,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.reply_all_outlined,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.forward,
            color: Colors.black,
          ),
        ),
      ]),
    );
  }
   String? returnName(int x) {
    String? fname;
    String? lname;
    String? fullName;
    for (int index = 0; index < globalVariables.Users!.length; index++) {
      if (globalVariables.Users![index].userID == x) {
        fname = globalVariables.Users![index].fname;
        lname = globalVariables.Users![index].lname;
        fullName = "${fname} ${lname}";
      }
    }
    return fullName;
  }
}