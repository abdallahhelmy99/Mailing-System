//Hena hanshel ay global me7tageno zy list of users aw contacts aw mails
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mailing_system/dbHelper.dart';
import '../Classes/Contact.dart';
import '../Classes/User.dart';
import '../Classes/Mail.dart';

class globalVariables {
  static dbHelper helper = dbHelper();
  static List<User>? Users;
  static User? currentUser;
  static List<Mail>? MyMails;
  static List<Contact>? contacts;

  static User? getUserInstance() {
    if (globalVariables.currentUser == null) {
      return currentUser = User(
          userID: null,
          fname: null,
          lname: null,
          phoneNo: null,
          dob: null,
          email: null,
          password: null);
    }
    return currentUser;
  }

  static void dispose() {
    currentUser = null;
  }

  static void readData() async {
    Users = await helper.readUsers();
  }

  static void readInbox() async {
    MyMails = await helper.readInbox();
  }

  static void readDraft() async {
    MyMails = await helper.readDraft();
  }

  static void readImportant() async {
    MyMails = await helper.readImportant();
  }

  static void readSpam() async {
    MyMails = await helper.readSpam();
  }

  static void readTrash() async {
    MyMails = await helper.readTrash();
  }

  static void readSent() async {
    MyMails = await helper.readSent();
  }
  //function to show toast message

}
