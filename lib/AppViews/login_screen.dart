import 'package:flutter/material.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedWidgets appBarObj = SharedWidgets();
 bool isObsecure = true;
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
                        Navigator.pushNamed(context, ("inbox"));
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
