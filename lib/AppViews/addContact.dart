import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({super.key});

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  SharedWidgets appBarObject = SharedWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            TextFieldBuilder('Name', TextInputType.name, const Icon(Icons.abc)),
            const SizedBox(
              height: 10.0,
            ),
            TextFieldBuilder('E-mail', TextInputType.emailAddress,
                const Icon(Icons.alternate_email)),
            const SizedBox(
              height: 10.0,
            ),
            TextFieldBuilder(
                'Phone Number', TextInputType.phone, const Icon(Icons.phone)),
            const SizedBox(
              height: 10.0,
            ),
            TextFieldBuilder(
                'Relation', TextInputType.text, const Icon(Icons.people)),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.black,
          child: Icon(Icons.check)),
    );
  }
}

Widget TextFieldBuilder(String labeltxt, TextInputType x, Icon s) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: labeltxt, border: InputBorder.none, suffixIcon: s),
        keyboardType: x,
      ),
    ),
  );
}