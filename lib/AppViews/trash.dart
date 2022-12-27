// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../SharedMaterial/shared_styles.dart';
import '../SharedMaterial/shared_widgets.dart';
import 'package:badges/badges.dart' as bd;

class TrashScreen extends StatefulWidget {
  const TrashScreen({super.key});

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  var size, height, width;
  SharedWidgets appBarObject = SharedWidgets();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    SharedWidgets appBarObj = SharedWidgets();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        //el app bar hena lazmeto en el status bar yb2a nafs loon el theme
        appBar: appBarObj.appBar(
            100,
            Text("Trash",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SourceSansPro')),
            null,
            IconButton(
              color: Colors.black,
              icon: const Icon(LineAwesomeIcons.angle_left),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height / 32),
              //Cards El Emails Hena
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  physics: PageScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: width / 32, bottom: height / 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          height: height / 6,
                          width: width,
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: height / 32, left: width / 64),
                            child: bd.Badge(
                                position:
                                    bd.BadgePosition.topEnd(top: 5, end: 10),
                                badgeContent: Icon(
                                  Icons.circle,
                                  color: Colors.transparent,
                                  size: 3,
                                ),
                                badgeColor: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 10, top: height / 40),
                          child: Text(
                            "Abdallah Hussam",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 10, top: height / 18),
                          child: Text(
                            "Mail Subject",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 10, top: height / 12),
                          child: Text(
                            "Mail Content Should Be Shown Here, Mail Content Should Be Shown Here",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height / 38, left: width - 70),
                          child: Text(
                            "8:12 PM",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ]));
  }
}
