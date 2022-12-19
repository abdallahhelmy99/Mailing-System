
class User {
  String? fname;
  String? lname;
  String? phoneNo;
  String? dob;
  String? email;
  String? password;
  List<User>? contacts;

  User({
<<<<<<< HEAD
      required this.fname,
      required this.lname,
      required this.phoneNo,
      required this.dob,
      required this.email,
      required this.password,
      });
=======
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
>>>>>>> fa82aa939f709acf4c013dec25de33072c3a5b7b

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
