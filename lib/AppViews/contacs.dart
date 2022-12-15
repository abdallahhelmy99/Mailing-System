import 'package:flutter/material.dart';
import 'package:mailing_system/SharedMaterial/shared_colors.dart';
import 'package:mailing_system/SharedMaterial/shared_styles.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.thirdColor,
          leading:BackButton(
                onPressed: () {},
                  color: Colors.black,
                ),
          title: const Text('My Contacts',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cabin')),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
                splashRadius: 25),
          ]),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          contactsView('Youef', 'Azzam', 'yousefazzam@gmail.com'),
          contactsView('Basil', 'Marwan', 'basilmarwan12@gmail.com'),
          contactsView('Bassel', 'Amr', 'basselkamel@gmail.com'),
          contactsView('Hazem', 'Hossam', 'hazemhossss@gmail.com'),
          contactsView('Hazem', 'Tamer', 'gobrannn@gmail.com'),
          contactsView('Abdullah', 'Hussam', 'abdullah@gmail.com'),
          contactsView('Ahmed', 'Ebrahim', 'hahmed@gmail.com'),
          contactsView('essam', 'Tamer', 'eso@gmail.com'),
          contactsView('Bahgat', 'Hussam', 'Baghhhh@gmail.com'),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.black,
          child: Icon(Icons.add)),
    );
  }
}

Card contactsView(String fname, String lname, String email) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(capitalize(fname) + capitalize(lname)),
      ),
      title: Text(
        '$fname $lname',
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
