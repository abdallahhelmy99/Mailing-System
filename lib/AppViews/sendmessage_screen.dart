import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mailing_system/SharedMaterial/shared_styles.dart';
import 'package:file_picker/file_picker.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  String curretnLoggedUserMail = "123@gmail.com";
  TextEditingController subjectFieldController = TextEditingController();
  TextEditingController receiverFieldController = TextEditingController();
  TextEditingController msgBodyController = TextEditingController();
  FilePickerResult? pickVariable;
  bool removeAttach = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 120.0),
              child: Text("New Message", style: SharedFonts.thirdStyle),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child:
                      Icon(Icons.cloud_circle, color: Colors.white, size: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 10),
                  child: Text(
                    curretnLoggedUserMail,
                    style: SharedFonts.smallStyle,
                  ),
                )
              ],
            )
          ],
        ),
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.black,
        elevation: 40,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.teal],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {},
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
                child: TextField(
                    cursorColor: Colors.black,
                    controller: receiverFieldController,
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
                  return Row(
                    children: removeAttach == true
                        ? [
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
                            Text(pickVariable?.files[index].name ?? " " ,style: SharedFonts.attachStyle)
                          ]
                        : [],
                  );
                }),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
                    if(pickVariable !=null){
                      setState(() {
                        
                      });
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
