// ignore_for_file: unused_local_variable, unnecessary_new
 
import 'package:flutter/material.dart';
import 'package:mailing_system/AppViews/inboxPage.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';
import 'package:mailing_system/dbHelper.dart';
import 'package:mailing_system/SharedMaterial/globals.dart';

import '../Classes/User.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedWidgets appBarObj = SharedWidgets();
  bool isObsecure = true;
  TextEditingController mail =  TextEditingController();
  TextEditingController pass =  TextEditingController();
  bool isValid = false;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarObj.appBar(
        150,
        Container(
          padding: const EdgeInsets.only(top: 100, bottom: 60),
          alignment: Alignment.topLeft,
          child: Text(
            'Sign In',
            style: TextStyle(
                color: Theme.of(context).bottomAppBarColor,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
        ),
      ),
      extendBodyBehindAppBar: false,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  controller: mail,
                  onFieldSubmitted: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: pass,
                obscureText: isObsecure,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        icon: Icon(isObsecure == true
                            ? Icons.visibility_rounded
                            : Icons.visibility_off)),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock)),
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).accentColor,
                    ),
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                       
                          if (mail.text != "" || pass.text != "") {
                            for (int i = 0; i < globalVariables.Users!.length; i++) {
                              if (mail.text == globalVariables.Users![i].email && pass.text == globalVariables.Users![i].password) {
                                
                                globalVariables.currentUser = new User(fname: globalVariables.Users?[i].fname, lname: globalVariables.Users?[i].lname, phoneNo: globalVariables.Users?[i].phoneNo, dob: globalVariables.Users?[i].dob, email: globalVariables.Users?[i].email, password:globalVariables.Users?[i].password
                                );        
                                mail.clear();
                                pass.clear();
                                setState(() {
                                  isValid = true;
                                });
                                break;
                              } 
                              
                               else {
                                setState(() {
                                  isValid = false;
                                });
                               } 
                            } //for loop
                          }
                          else {
                            const blankError = SnackBar(
                              content: Text(
                                  'Please Fill Email and Password Fields !'),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(blankError);
                          } // if kbera
                      
                      

                        if ( isValid && mail.text != "" && pass.text != "" ){
                          const loginGreeting = SnackBar(
                                  content: Text('Login Successfull !'),
                                  backgroundColor: Colors.green,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(loginGreeting);
                          Navigator.pushNamed(context, 'inbox');
                               
                        }
                        else {
                                const credsError = SnackBar(
                                  content: Text(
                                      'Credentials Not Found, Please Try Again !'),
                                  backgroundColor: Colors.red,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(credsError);
                        }//I
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "register");
                      },
                      child: const Text(
                        'Don\'t have an account ? Register ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
