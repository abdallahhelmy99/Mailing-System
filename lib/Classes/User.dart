
class User {
  String? fname;
  String? lname;
  String? phoneNo;
  String? dob;
  String? email;
  String? password;
  List<User>? contacts;

  User({
    required this.fname,
    required this.lname,
    required this.phoneNo,
    required this.dob,
    required this.email,
    required this.password,
  });

  User.fromMap(Map<dynamic, dynamic> db) {
    this.fname = db['fname'];
    this.lname = db['lname'];
    this.phoneNo = db['phoneNo'];
    this.dob = db['dob'];
    this.email = db['email'];
    this.password = db['password'];
  }

  Map<String, dynamic> toMap() {
    return {
      'fname': fname,
      'lname': lname,
      'phoneNo': phoneNo,
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
