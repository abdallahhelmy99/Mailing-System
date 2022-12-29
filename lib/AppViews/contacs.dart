import 'package:flutter/material.dart';
import 'package:mailing_system/SharedMaterial/globals.dart';
import 'package:mailing_system/SharedMaterial/shared_colors.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  SharedWidgets appBarObj = SharedWidgets();

  @override
  void initState() {
    // globalVariables.contacts = [];
    // globalVariables.readMyContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      globalVariables.readMyContacts();
    });
    return Scaffold(
      appBar: appBarObj.appBar(
        80.0,
        const Text('My Contacts',
            style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cabin')),
        <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
              splashRadius: 25),
        ],
        BackButton(
          onPressed: () {
            Navigator.pushNamed(context, 'inbox');
          },
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
          itemCount: globalVariables.contacts!.length == null
              ? 0
              : globalVariables.contacts!.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return contactsView('${globalVariables.contacts![index].name}',
                '${globalVariables.contacts![index].email}');
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'addContact');
          },
          backgroundColor: Colors.black,
          child: Icon(Icons.add)),
    );
  }
}

Card contactsView(String name, String email) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey[600],
        child: Text(capitalize(name)),
      ),
      title: Text(
        '$name',
        style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cabin'),
      ),
      subtitle: Text(
        email,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {},
      ),
    ),
  );
}

String capitalize(String s) {
  return s[0].toUpperCase();
}
