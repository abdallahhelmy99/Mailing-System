//Hena hanshel ay global me7tageno zy list of users aw contacts aw mails 
import 'package:mailing_system/dbHelper.dart';
import '../Classes/User.dart';
import '../Classes/Mail.dart';

class globalVariables {
  static dbHelper helper = dbHelper();
  static List<User>? Users;
  static User? currentUser;
  static List<Mail>? MyMails;


  static void dispose() {
    currentUser = null;
  }


  static void readData() async{
    Users = await helper.readUsers();
  }

   static void readMyMails() async{
    MyMails = await helper.readMyEmails();
  }

}
