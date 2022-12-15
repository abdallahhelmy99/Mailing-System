
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class inboxPage extends StatefulWidget {
  @override
  State<inboxPage> createState() => _inboxPageState();
}

class _inboxPageState extends State<inboxPage> {
  var size, height, width;

  var selectedfolder = 'Inbox';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height / 64),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: width / 13),
              CircleAvatar(backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a/AEdFTp7HB1ZjlorTV0wExaxhYEFjVlpn5ODkxRXx6aSHnw=s288-p-rw-no'),radius: 26, backgroundColor: Color.fromARGB(255,239,239,239), child: IconButton(icon: Icon(color: Colors.transparent, Icons.person), onPressed: (){},)),
              SizedBox(
                width: width/2,
              ),
             IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.black, size: 30,), splashRadius: 25),
              Badge(position: BadgePosition.topEnd(top: 10, end: 10),badgeContent: Icon(Icons.circle ,color: Color.fromARGB(255,212,64,64), size: 2,),child: IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: Colors.black, size: 30,), splashRadius: 25)),
            ],
          ),
          SizedBox(
            height: height / 128,
          ),
          Container(alignment: Alignment.center,child: Text("Inbox", textAlign: TextAlign.center, style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Badge(position: BadgePosition.topEnd(top: 10, end: 10),),
              SizedBox(width: 5,),
              Container(alignment: Alignment.center,child: Text("10 Unread Messages ", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)),
          ],),
           SizedBox(
            height: height / 32,
          ),
          Padding(
            padding: EdgeInsets.only(left: width/6),
            child: Row( children: [
              CircleAvatar(backgroundColor: Colors.white,radius: 30,child: IconButton(icon: Icon(Icons.drafts, color: Colors.black), onPressed: (){}, iconSize: 40,)),
              SizedBox(width: width/64,),
              CircleAvatar(backgroundColor: Colors.white,radius: 30,child: IconButton(icon: Icon(Icons.folder, color: Colors.black), onPressed: (){}, iconSize: 40,)),
              SizedBox(width: width/64,),
              CircleAvatar(backgroundColor: Colors.white,radius: 30,child: IconButton(icon: Icon(Icons.folder_delete, color: Colors.black), onPressed: (){}, iconSize: 40,)),
              SizedBox(width: width/64,),
              CircleAvatar(backgroundColor: Colors.white,radius: 30,child: IconButton(icon: Icon(Icons.folder_special, color: Colors.black), onPressed: (){}, iconSize: 40,)),
              //SizedBox(width: width/64,),
              //CircleAvatar(backgroundColor: Colors.white,radius: 30,child: IconButton(icon: Icon(Icons.settings, color: Colors.black), onPressed: (){}, iconSize: 40,)),
            ],),
          ),
          SizedBox(height: height/32,),
          //hena el item builder
          Container(
            height: 1,
            width: width,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                right: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: width/32, bottom: height/24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          
                    ),
                    height: height/6,
                    width: width,
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: height/32, left: width/64),
                      child: Badge(position: BadgePosition.topEnd(top: 5, end: 10),badgeContent: Icon(Icons.circle ,color: Colors.transparent, size: 3,), badgeColor: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width/10, top: height/40),
                    child: Text("Abdallah Hussam", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width/10, top: height/18),
                    child: Text("Mail Subject", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width/10, top: height/12),
                    child: Text("Mail Content Should Be Shown Here, Mail Content Should Be Shown Here", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
                  ),         
                  Padding(
                    padding: EdgeInsets.only(top: height/38, left: width-70),
                    child: Text("8:12 PM", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
                  ),  
                  ],
                );
            },),
          ),
          
          
          ])

    );
  }
}

