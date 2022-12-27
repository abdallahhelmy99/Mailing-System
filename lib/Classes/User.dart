
class User {
  String? fname;
  String? lname;
  String? phoneNo;
  String? dob;
  String? email;
  String? password;
  String? workExp='';
  String? education='';
  List<User>? contacts;

  User({
      required this.fname,
      required this.lname,
      required this.phoneNo,
      required this.dob,
      required this.email,
      required this.password,
      });

  Map<String, dynamic> toMap() {
    return {
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
