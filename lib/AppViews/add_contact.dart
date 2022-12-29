// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';
import 'package:mailing_system/dbHelper.dart';
import 'package:mailing_system/SharedMaterial/globals.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({super.key});

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  SharedWidgets appBarObject = SharedWidgets();
  dbHelper dbObj = dbHelper();
  String? curretnLoggedUserMail = globalVariables.currentUser!.email;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController relation = TextEditingController();
  bool nameIsEmpty = true;
  bool emailIsEmpty = true;
  bool phonenoIsEmpty = true;
  bool relationIsEmpty = true;
  int contactUserID = 13883;
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarObject.appBar(
        80.0,
        const Text('Add Contacts',
            style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cabin')),
        null,
        BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 140.0),
        child: Column(
          children: [
            TextFieldBuilderNormal(
                'Name', TextInputType.name, const Icon(Icons.abc), name),
            const SizedBox(
              height: 10.0,
            ),
            TextFieldBuilder('E-mail', TextInputType.emailAddress,
                const Icon(Icons.alternate_email), email, contactUserID),
            const SizedBox(
              height: 10.0,
            ),
            TextFieldBuilderNormal('Phone Number', TextInputType.phone,
                const Icon(Icons.phone), phoneno),
            const SizedBox(
              height: 10.0,
            ),
            TextFieldBuilderNormal('Relation', TextInputType.text,
                const Icon(Icons.people), relation),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            globalVariables.readMyContacts();
            if (email.text != "" &&
                name.text != "" &&
                phoneno.text != "" &&
                relation.text != "") {
              dbObj.insertData(
                  "Insert into Contacts(userID,contact_ID,contactname,contactemail,phonenum,relation) values('${globalVariables.currentUser!.userID}','$contactUserID','${name.text}','${email.text}','${phoneno.text}','${relation.text}')");
              var snackBar = const SnackBar(
                content: Text('Contact added succesfully!'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
                elevation: 10,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              setState(() {
                nameIsEmpty = false;
                emailIsEmpty = false;
                phonenoIsEmpty = false;
                relationIsEmpty = false;
                globalVariables.readMyContacts();
                Navigator.pushNamed(context, 'contacts');
              });
            } else if (nameIsEmpty == true ||
                emailIsEmpty == true ||
                phonenoIsEmpty == true ||
                relationIsEmpty == true) {
              var snackBar = const SnackBar(
                content: Text('Please All fields !'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
                elevation: 10,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              setState(() {
                nameIsEmpty = true;
                phonenoIsEmpty = true;
                emailIsEmpty = true;
                relationIsEmpty = true;
              });
            }
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.check)),
    );
  }
}

// ignore: non_constant_identifier_names
Widget TextFieldBuilder(
    String labeltxt, TextInputType x, Icon s, TextEditingController a, int c) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: a,
        onSubmitted: (value) {
          for (int i = 0; i < globalVariables.Users!.length; i++) {
            for (int j = 0;
                j < globalVariables.currentUser!.contacts!.length;
                j++) {
              if (globalVariables.Users![i].email == a.text) {
                c = globalVariables.Users![i].userID!;
              }
            }
          }
        },
        decoration: InputDecoration(
            labelText: labeltxt, border: InputBorder.none, suffixIcon: s),
        keyboardType: x,
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget TextFieldBuilderNormal(
    String labeltxt, TextInputType x, Icon s, TextEditingController b) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: b,
        decoration: InputDecoration(
            labelText: labeltxt, border: InputBorder.none, suffixIcon: s),
        keyboardType: x,
      ),
    ),
  );
}
