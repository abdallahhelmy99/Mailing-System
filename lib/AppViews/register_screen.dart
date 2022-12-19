import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mailing_system/SharedMaterial/shared_styles.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';

import '../dbHelper.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  SharedWidgets appBarObj = SharedWidgets();

  dbHelper helper = new dbHelper(); //3ayzen nshoof 7all 3shan man3odsh ncreate object kol mara (Singleton)
  TextEditingController fname = new TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();

  Widget TextFieldBuilder(
      String labeltxt, TextInputType x, Icon s, bool obsecure, TextEditingController text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        obscureText: obsecure,
        controller: text,
        decoration: InputDecoration(
            labelText: labeltxt, border: InputBorder.none, suffixIcon: s),
        keyboardType: x,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: appBarObj.appBar(
          150,
          Container(
              child: Text(
            "Register",
            style: SharedFonts.thirdStyle,
          ))),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
               TextFieldBuilder('First Name', TextInputType.name,
                  const Icon(Icons.abc), false, fname),
                const SizedBox(
                  height: 20,
                ),
                  TextFieldBuilder('Last Name', TextInputType.name,
                  const Icon(Icons.abc), false, lname),
                const SizedBox(
                  height: 20,
                ),
                TextFieldBuilder('Email Address', TextInputType.emailAddress,
                  const Icon(Icons.alternate_email), false, email),
                const SizedBox(
                  height: 20,
                ),
                TextFieldBuilder('Password', TextInputType.visiblePassword,
                    const Icon(Icons.password), true, pass),
                const SizedBox(
                  height: 20,
                ),
                TextFieldBuilder(
                    'Confirm Password',
                    TextInputType.visiblePassword,
                    const Icon(Icons.password),
                    true, confirmpass),
                const SizedBox(
                  height: 20,
                ),
                TextFieldBuilder('Phone Number', TextInputType.number,
                    const Icon(Icons.phone), false, phone),
                const SizedBox(
                  height: 20,
                ),
                TextFieldBuilder('Date of birth', TextInputType.datetime,
                    const Icon(Icons.date_range), false, dob),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).accentColor,
                  ),
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                    setState((){
                      if ( fname.text != "" || lname.text != "" || email.text != "" || pass.text != "" || phone.text != "" || dob.text != "") {
                        helper.insertData(
                            "INSERT INTO Users(fname,lname,dob,email,password,phonenum) VALUES('${fname.text}','${lname.text}','${dob.text}','${email.text}','${pass.text}','${phone.text}')");

                        const regist_Success = SnackBar(
                          content: Text('Account Created Successfully !'),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(regist_Success);

                        //navigate lel bernameg nafso (inbox page) HAZEM
                      }
                      else {
                        const errorMessage = SnackBar(
                          content: Text('Please Fill All Fields And Try Again !', style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(errorMessage);
                      }
                      });
                  },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
