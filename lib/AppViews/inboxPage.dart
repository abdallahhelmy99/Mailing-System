// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart' as bd;
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mailing_system/AppViews/profile_screen.dart';
import 'package:mailing_system/Classes/Mail.dart';
import 'package:mailing_system/Classes/User.dart';
import 'package:mailing_system/SharedMaterial/globals.dart';
import 'package:mailing_system/dbHelper.dart';

import '../SharedMaterial/shared_widgets.dart';

class inboxPage extends StatefulWidget {
  inboxPage({super.key});

  @override
  State<inboxPage> createState() => _inboxPageState();
}

class _inboxPageState extends State<inboxPage> {
  var size, height, width;
  TextEditingController text = new TextEditingController();
  String selectedfolder = 'Inbox';
  dbHelper helper = dbHelper();
  globalVariables x = globalVariables();

  @override
  void initState() {
    globalVariables.MyMails = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    SharedWidgets appBarObj = SharedWidgets();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'sendMessage');
          },
          child: Icon(Icons.send_rounded),
          backgroundColor: Colors.black),
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      //el app bar hena lazmeto en el status bar yb2a nafs loon el theme
      appBar: appBarObj.appBar(
          80,
          null,
          <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'trash');
                },
                icon: Icon(
                  Icons.delete_outlined, //Trash
                  color: Colors.black,
                  size: 25,
                ),
                splashRadius: 25),
            IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (Route route) => false);
                  globalVariables.dispose();
                },
                icon: Icon(
                  Icons.login_outlined,
                  color: Colors.black,
                  size: 28,
                ),
                splashRadius: 25),
          ],
          Container(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a/AEdFTp7HB1ZjlorTV0wExaxhYEFjVlpn5ODkxRXx6aSHnw=s288-p-rw-no'),
                radius: 26,
                backgroundColor: Color.fromARGB(255, 239, 239, 239),
                child: IconButton(
                  icon: Icon(color: Colors.transparent, Icons.person),
                  onPressed: () {
                    Navigator.pushNamed(context, 'profile');
                  },
                )),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height / 32),
          SizedBox(
            height: height / 128,
          ),
          //Kelmet Inbox emfrood tetghyr 3la hasab el folder
          Container(
              alignment: Alignment.center,
              child: Text(
                "${selectedfolder}", //selectedfolder
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              )),
          //Unread Messages Counter
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bd.Badge(
                position: bd.BadgePosition.topEnd(top: 10, end: 10),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                   "${globalVariables.MyMails!.length} " +
                        "Unread Messages", //Hena lazem nafs el counter
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  )),
            ],
          ),
          SizedBox(
            height: height / 32,
          ),
          //El Icons bta3t El folders
          Padding(
            padding: EdgeInsets.only(left: width / 12 - 4),
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(
                      icon: Icon(Icons.drafts, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          globalVariables.MyMails!.clear(); 
                          globalVariables.readInbox();
                          selectedfolder = 'Inbox';
                        });
                      },
                      iconSize: 30,
                    )),
                SizedBox(
                  width: width / 64,
                ),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(
                      icon: Icon(Icons.folder, color: Colors.black),
                      onPressed: () {
                         setState(() {
                          globalVariables.MyMails!.clear();
                          globalVariables.readDraft();
                          selectedfolder = 'Drafts';
                        });
                      },
                      iconSize: 30,
                    )),
                SizedBox(
                  width: width / 64,
                ),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(
                      icon: Icon(Icons.folder_delete, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          globalVariables.MyMails!.clear();
                          globalVariables.readTrash();
                          selectedfolder = 'Trash';
                        });
                      },
                      iconSize: 30,
                    )),
                SizedBox(
                  width: width / 64,
                ),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(
                      icon: Icon(Icons.folder_special, color: Colors.orange),
                      onPressed: () {
                        setState(() {
                          globalVariables.MyMails!.clear();
                          globalVariables.readImportant();
                          selectedfolder = 'Important';
                        });
                                                
                      },
                      iconSize: 30,
                    )),
                SizedBox(
                  width: width / 64,
                ),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(
                      icon: Icon(Icons.send_rounded, color: Colors.black),
                      onPressed: () {
                       setState(() {
                          globalVariables.MyMails!.clear();
                          globalVariables.readSent();
                          selectedfolder = 'Sent';
                        });
                      },
                      iconSize: 30,
                    )),
                SizedBox(
                  width: width / 64,
                ),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(
                      icon: Icon(Icons.contacts, color: Colors.black),
                      onPressed: () {
                        Navigator.pushNamed(context, 'contacts');
                        setState(() {
                          helper.readMyContacts();
                        });
                        //helper.insertData('INSERT INTO mail (id,subject,from,to,cc,bcc,attachment,mailBody) VALUES (1,"test","1","1","test","test","test","test")');
                      },
                      iconSize: 30,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: height / 64,
          ),
          //Container Shayel El AnimSeaerchBar
          Container(
              padding: EdgeInsets.only(left: width / 32, bottom: height / 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              height: 90,
              width: width,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: height / 64, right: width / 32, left: width / 128),
                    child: AnimSearchBar(
                      onSubmitted: (p0) {},
                      color: Colors.grey[350],
                      width: width - 30,
                      textController: text,
                      onSuffixTap: () {},
                    ),
                  ),
                ],
              )),
          //Cards El Emails Hena
          Expanded(
            child: ListView.builder(
              itemCount: globalVariables.MyMails!.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (globalVariables.MyMails!.isNotEmpty){
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'mail'); //Hena lazem a-pass
                    //globalVariables.selectedMail = globalVariables.MyMails![index];
                  },
                  child: Slidable(
                    direction: Axis.horizontal,
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      extentRatio: 1,
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            //update query
                            setState(() {
                              helper.updateData("UPDATE mail SET trash = 'true' WHERE emailID = ${globalVariables.MyMails![index].emailID}");
                            });
                          }, //DELETE QUERY SQL + setState
                          icon: Icons.delete,
                          label: "Trash",
                          backgroundColor: Colors.red,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              helper.updateData("UPDATE mail SET important = 'true' WHERE emailID = ${globalVariables.MyMails![index].emailID}");
                            });
                          }, //FAVORITE QUERY SQL + setState
                          icon: Icons.star,
                          label: "Important",
                          backgroundColor: Colors.green,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              helper.updateData("UPDATE mail SET draft = 'true' WHERE emailID = ${globalVariables.MyMails![index].emailID}");
                            });
                          },
                          icon: Icons.drafts,
                          label: "Draft",
                          backgroundColor: Colors.blue,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              helper.updateData("UPDATE mail SET spam = 'true' WHERE emailID = ${globalVariables.MyMails![index].emailID}");
                            });
                          },
                          icon: Icons.folder_off_outlined,
                          label: "Spam",
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                      ],
                    ),
                    startActionPane: ActionPane(
                      extentRatio: 0.6,
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.push_pin_outlined,
                          label: "Pin",
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                         SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.push_pin_outlined,
                          label: "Delete",
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: width / 64, top: height / 82),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          height: height / 6,
                          width: width,
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: height / 64, left: width / 64),
                              child: Icon(
                                Icons.circle,
                                color: Colors.red,
                                size: 20,
                              )),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: width / 10, top: height / 40),
                          child: Text(
                            "${returnName(globalVariables.MyMails![index].senderID!)}",
                            // "${globalVariables.Users![index].fname }" //Sender Name - "${snapshot.data[index]['task']}"
                            //for (int i = 0; i < globalVariables.Users!.length; i++)
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: width / 10, top: height / 16),
                          child: Text(
                            "${globalVariables.MyMails![index].subject}", //Mail Subject
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: width / 10, top: height / 9.5),
                          child: Text(
                            "${globalVariables.MyMails![index].body}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: height / 38, left: width - 95),
                          child: Text(
                            "${globalVariables.MyMails![index].date}",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                }
                else{
                  //return snackbar here
                  return SnackBar(content: Text("No Mails Found"),);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  String? returnName(int x) {
    String? fname;
    String? lname;
    String? fullName;
    for (int index = 0; index < globalVariables.Users!.length; index++) {
      if (globalVariables.Users![index].userID == x){
        fname = globalVariables.Users![index].fname;
      lname = globalVariables.Users![index].lname;
      }
      fullName = "${fname} ${lname}";
    }
    return fullName;
  }
}
