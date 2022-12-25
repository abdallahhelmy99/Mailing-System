
import 'package:mailing_system/Classes/Mail.dart';

class User {
  int ?userID;
  String? fname;
  String? lname;
  String? phoneNo;
  String? dob;
  String? email;
  String? password;
  List<User>? contacts;
  List<Mail>? mailObj;

  User({
      required this.userID,
      required this.fname,
      required this.lname,
      required this.phoneNo,
      required this.dob,
      required this.email,
      required this.password,
      this.mailObj
      });

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'fname': fname,
      'lname': lname,
      'phonenum': phoneNo,
      'dob': dob,
      'email': email,
      'password': password,
      //'contacts': contacts,
    };
  }

  @override
  String toString() {
    return 'User{fname: $fname, lname: $lname, phoneNo: $phoneNo, dob: $dob, email: $email, password: $password }';
  }
}
