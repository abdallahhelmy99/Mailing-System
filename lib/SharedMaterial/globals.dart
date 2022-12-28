//Hena hanshel ay global me7tageno zy list of users aw contacts aw mails
import 'package:mailing_system/dbHelper.dart';
import '../Classes/User.dart';
import '../Classes/Mail.dart';

class globalVariables {
  static dbHelper helper = dbHelper();
  static List<User>? Users;
  static User? currentUser;
  static List<Mail>? MyMails;

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
<<<<<<< HEAD

   static void readMyMails() async{
    MyMails = await helper.readMyEmails();
  }

=======
>>>>>>> 9ced9e4a40dd0a876f3fb8008d1252bc1a844185
}
