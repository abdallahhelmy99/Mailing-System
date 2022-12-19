import 'package:flutter/material.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';
import 'package:mailing_system/dbHelper.dart';

import '../Classes/User.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedWidgets appBarObj = SharedWidgets();
  bool isObsecure = true;
  TextEditingController mail = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  dbHelper helper = dbHelper();
  List<User>? Users;

  void readData() async{
    Users = await helper.readUsers();
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

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
                  suffixIcon:IconButton(onPressed: (){
                    setState(() {
                      isObsecure=!isObsecure;
                    });
                  },
                  icon:Icon(isObsecure == true ? Icons.visibility_rounded : Icons.visibility_off  )  ),
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

                      //Navigator.pushNamed(context, ("Inboxpage"));
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
                      setState(() {
                        for(int i = 0; i < Users!.length; i++){
                          if ( mail.text == Users![i].email && pass.text == Users![i].password ){
                            const loggedIn = SnackBar(
                              content: Text('Logged In Successfully'),
                              backgroundColor: Colors.green,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(loggedIn);
                            //Navigate To Inbox
                          }
                          else{
                            const loggedIn = SnackBar(
                              content: Text('Credentials Not Found, Please Try Again'),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(loggedIn);
                          }

                        }
                      });
                      //Navigator.pushNamed(context, "RegisterScreen");
                    },
                    child: const Text(
                      'Don\'t have an account ? Register ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
