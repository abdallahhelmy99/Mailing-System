
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: width / 4,
                  ),
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.delete,
                      )),
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.label_important_outline,
                      )),
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.error_outlined,
                      )),
                ]),
          ),
          SizedBox(
            height: height / 18,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width / 2,
                child: Text(
                  'Email Subject',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              )),
          SizedBox(
            height: height / 20,
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.only(left: 10)),
              CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://lh3.googleusercontent.com/a/AEdFTp7HB1ZjlorTV0wExaxhYEFjVlpn5ODkxRXx6aSHnw=s288-p-rw-no'),
                  radius: 26,
                  backgroundColor: Color.fromARGB(255, 239, 239, 239)),
              SizedBox(
                width: width / 18,
              ),
              Container(
                child: Text(
                  'Sender Name',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                width: width / 2.5,
              ),
              Text(
                "8:12 PM",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(
            height: height / 20,
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: SingleChildScrollView(
                  child: Text(
                      'Each member should be able to add information about their basic profile, work experience, education, e o Any user of our system should be able to search other members, groups or pages by their name.o Members should be able to send and accept/reject friend requests from other members.o Members should be able to follow other members without becoming their friend.o Members should be able to create groups and pages, as well as join already created groups, and follow pages.o Members should be able to create new posts to share with their friends.o Members should be able to add comments to posts, as well as like or share a post or comment..o The system should send a notification to a member whenever there is a new message or friend request or comment on their post o Members should be able to search through posts for a word.Member: All members can search for other members, groups, pages, or posts, asAdmin: Mainly responsible for admin functions like blocking and unblocking aSystem: Mainly responsible for sending notifications for new messages, friend Each member should be able to add information about their basic profile, work experience, education, e o Any user of our system should be able to search other members, groups or pages by their name.o Members should be able to send and accept/reject friend requests from other members.o Members should be able to follow other members without becoming their friend.o Members should be able to create groups and pages, as well as join already Each member should be able to add information about their basic profile, work experience, ed'),
                )),
          )
        ],
      ),
    );
  }
}
