//Hena hanshel ay global me7tageno zy list of users aw contacts aw mails 
import 'package:mailing_system/dbHelper.dart';
import '../Classes/User.dart';

class globalVariables {
  static dbHelper helper = dbHelper();
  static List<User>? Users;
  static User? currentUser;


  static void dispose() {
    currentUser = null;
  }


  static void readData() async{
    Users = await helper.readUsers();
  }

}
