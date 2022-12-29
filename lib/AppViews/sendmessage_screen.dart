import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:mailing_system/Classes/Mail.dart';
import 'package:mailing_system/Interfaces/datetimeAdapter.dart';
import 'package:mailing_system/SharedMaterial/globals.dart';
import 'package:mailing_system/SharedMaterial/shared_styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';
import 'package:mailing_system/dbHelper.dart';

import '../SharedMaterial/notificationsFactory.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});
  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  SharedWidgets appBar = SharedWidgets();
  dbHelper dbObj = dbHelper();
  String? curretnLoggedUserMail = globalVariables.currentUser!.email;
  TextEditingController toField = TextEditingController();
  TextEditingController subjectFieldController = TextEditingController();
  TextEditingController msgBodyController = TextEditingController();
  NotificationFactory notifiyIns=EmailNotificationFactory(FlutterLocalNotificationsPlugin());
  FilePickerResult? pickVariable;
  bool removeAttach = true;
  bool toIsEmpty = true;
  bool subjIsEmpty = true;
  bool msgBodyIsEmpty = true;
  DateTimeAdapter adapterObj=DateTimeAdapter(DateTime.now());
  int recieverUserID=13883;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: appBar.appBar(
        150.0,
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 72.0),
              child: Text("New Message", style: SharedFonts.thirdStyle),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Icon(Icons.cloud_circle_sharp,
                      color: Colors.lightBlue, size: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 10),
                  child: Text(
                    curretnLoggedUserMail!,
                    style: SharedFonts.smallStyle,
                  ),
                )
              ],
            )
          ],
        ),
        <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {
                  print(adapterObj);
                  if (toField.text != "" &&
                      subjectFieldController.text != "" &&
                      msgBodyController.text != "") {
                    dbObj.insertData(
                        "Insert into Mail(subject,body,trash,important,spam,isRead,date,senderID,receiverID) values('${subjectFieldController.text}','${msgBodyController.text}','${false}','${false}','${false}','${false}','${adapterObj}','${globalVariables.currentUser!.userID}','${recieverUserID}')");
                   var snackBar = const SnackBar(
                      content: Text('Message sent !!'),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                      elevation: 10,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    notifiyIns.createNotification("Email Sent to ${toField.text}","You Have Sucessfully Sent an Email !");
                    setState(() {
                      toIsEmpty = false;
                      subjIsEmpty = false;
                      msgBodyIsEmpty = false;
                      Navigator.pop(context);
                    });
                  } else if (toIsEmpty == true ||
                      subjIsEmpty == true ||
                      msgBodyIsEmpty == true) {
                    var snackBar = const SnackBar(
                      content: Text('Please All fields !'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 3),
                      elevation: 10,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    setState(() {
                      toIsEmpty = true;
                      subjIsEmpty = true;
                      msgBodyIsEmpty = true;
                    });
                  }
                  
                },
                icon: const Icon(
                  Icons.send_rounded,
                  size: 40,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 18,
              child: PhysicalModel(
                borderRadius: BorderRadius.circular(10),
                shadowColor: Colors.black,
                color: Colors.white,
                elevation: 5,
                child: InkWell(
                  onFocusChange: (value) {
                        for (int i = 0; i < globalVariables.Users!.length; i++) {
                          if (globalVariables.Users![i].email == toField.text) {
                            recieverUserID = globalVariables.Users![i].userID!;
                          }
                        }
                      },
                  child: TextField(
                      cursorColor: Colors.black,
                      controller: toField,
                      obscureText: false,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(0, 83, 72, 72),
                                  width: 0)),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "To :",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Cabin",
                                  fontSize: 15),
                            ),
                          ))),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 18,
              child: PhysicalModel(
                borderRadius: BorderRadius.circular(10),
                shadowColor: Colors.black,
                color: Colors.white,
                elevation: 5,
                child: TextField(
                    cursorColor: Colors.black,
                    controller: subjectFieldController,
                    obscureText: false,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0)),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Subject :",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Source",
                                fontSize: 15),
                          ),
                        ))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: PhysicalModel(
              color: Colors.white,
              shadowColor: Colors.black,
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width / 1,
                  child: TextField(
                    controller: msgBodyController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent))),
                  )),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 500),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: pickVariable?.files.length ?? 0,
                itemBuilder: ((context, index) {
                  return removeAttach == true
                      ? Card(
                          shape: const StadiumBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          elevation: 0,
                          color: Colors.lightBlue[900],
                          borderOnForeground: false,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      removeAttach = false;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  )),
                              Text(pickVariable?.files[index].name ?? " ",
                                  style: SharedFonts.attachStyle)
                            ],
                          ),
                        )
                      : const SizedBox();
                }),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        selectedFontSize: 13,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 13,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home_filled,
                    color: Colors.black,
                  )),
              label: "Home"),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () async {
                    removeAttach = true;
                    pickVariable = await FilePicker.platform
                        .pickFiles(allowMultiple: true);
                    if (pickVariable != null) {
                      setState(() {});
                    }
                  },
                  icon: const Icon(
                    Icons.attachment,
                    color: Colors.teal,
                  )),
              label: "Attach"),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cancel_rounded,
                    color: Colors.red,
                  )),
              label: "Cancel")
        ],
      ),
    );
  }
}
