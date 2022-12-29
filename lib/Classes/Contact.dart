import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Contact {
  String? name;
  String? email;
  String? phonenum;
  String? relation;
  int? userID;
  int? contactid;
  Contact(
      {required this.name,
      required this.email,
      required this.phonenum,
      required this.relation,
      required this.contactid,
      required this.userID});
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'relation': relation,
      'contactemail': email,
      'phonenum': phonenum,
      'contact_ID': contactid,
      'contactname': name,

      //'contacts': contacts,
    };
  }
}
