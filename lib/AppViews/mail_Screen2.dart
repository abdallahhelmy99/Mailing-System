
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mailing_system/SharedMaterial/shared_colors.dart';
import 'package:mailing_system/SharedMaterial/shared_icons.dart';


class EmailScreen2 extends StatelessWidget {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      
                    ),
                  SizedBox(
                    width: width/2,
                  ),
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                      Icons.drafts_outlined,
                      color: Colors.black,
                      ),          
                  ),
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                      Icons.flag_outlined,
                      color: Colors.amber,
                      ),          
                  ),
                  IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.redAccent,
                  )),
                ]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(left: width)),
              CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://lh3.googleusercontent.com/a/AEdFTp7HB1ZjlorTV0wExaxhYEFjVlpn5ODkxRXx6aSHnw=s288-p-rw-no'),
                  radius: 55,
                  backgroundColor: Color.fromARGB(255, 239, 239, 239)),
              SizedBox(
                height: height / 64,
              ),
              Container(
                child: Text(
                  'Sender Name',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 28, fontFamily: "Singa"),
                ),
              ),
              SizedBox(
                height: height / 128,
              ),
              Text(
                "8:12 PM",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(
            height: height / 32,
          ),
          Divider(
            color: Colors.grey,
            indent: width/8,
            endIndent: width/8,
          ),
          SizedBox(height: height/128,),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: width/25),
                  child: Container(
                    width: width / 2,
                    child: Text(
                      'Email Subject',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32, fontFamily: "SourceSansPro", fontWeight: FontWeight.bold),
                    ),
                  )
                ),
              SizedBox(width: width/3,),
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
            indent: width/8,
            endIndent: width/8,
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Text(
                      'Each member should be able to add information about their basic profile, work experience, education, e o Any user of our system should be able to search other members, groups or pages by their name.o Members should be able to send and accept/reject friend requests from other members.o Members should be able to follow other members without becoming their friend.o Members should be able to create groups and pages, as well as join already created groups, and follow pages.o Members should be able to create new posts to share with their friends.o Members should be able to add comments to posts, as well as like or share a post or comment..o The system should send a notification to a member whenever there is a new message or friend request or comment on their post o Members should be able to search through posts for a word.Member: All members can search for other members, groups, pages, or posts, asAdmin: Mainly responsible for admin functions like blocking and unblocking aSystem: Mainly responsible for sending notifications for new messages, friend Each member should be able to add information about their basic profile, work experience, education, e o Any user of our system should be able to search other members, groups or pages by their name.o Members should be able to send and accept/reject friend requests from other members.o Members should be able to follow other members without becoming their friend.o Members should be able to create groups and pages, as well as join already Each member should be able to add information about their basic profile, work experience, ed',
                      style: TextStyle(fontSize: 18, fontFamily: "SourceSansPro"),
                      ),
                )),
          )
        ],
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
}
