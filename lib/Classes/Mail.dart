class Mail {
  int? recieverID;
  int? senderID;
  String? emailID;
  String? subject;
  String? body;
  String? date;
  bool? trash;
  bool? important;
  bool? spam;
  bool? isRead;
  bool? isSent;

  Mail(
      {
      required this.emailID,
      required this.subject,
      required this.body,
      required this.date,
      required this.trash,
      required this.important,
      required this.spam,
      required this.isRead,
      required this.recieverID,
      required this.senderID,
      required this.isSent
      });

  Map<String, dynamic> toMap() {
    return {
      'emailID': emailID,
      'subject': subject,
      'body': body,
      'date': date,
      'trash': trash,
      'important': important,
      'spam': spam,
      'isRead': isRead,
      'senderID': senderID,
      'receiverID': recieverID,
      //'contacts': contacts,
    };
  }
}
