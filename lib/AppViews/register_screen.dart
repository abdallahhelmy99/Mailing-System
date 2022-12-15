import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  Widget TextFieldBuilder(
      String labeltxt, TextInputType x, Icon s, bool obsecure) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        obscureText: obsecure,
        decoration: InputDecoration(
            labelText: labeltxt, border: InputBorder.none, suffixIcon: s),
        keyboardType: x,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 45, bottom: 45),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldBuilder('First Name', TextInputType.name,
                    const Icon(Icons.abc), false),
                const SizedBox(
                  height: 20,
                ),
                TextFieldBuilder('Last Name', TextInputType.name,
                    const Icon(Icons.abc), false),
                const SizedBox(
                  height: 20,
                ),
                TextFieldBuilder('Email Address', TextInputType.emailAddress,
                    const Icon(Icons.alternate_email), false),
                const SizedBox(
                  height: 20,
                ),
                TextFieldBuilder('Password', TextInputType.visiblePassword,
                    const Icon(Icons.password), true),
                const SizedBox(
                  height: 20,
                ),
                TextFieldBuilder(
                    'Confirm Password',
                    TextInputType.visiblePassword,
                    const Icon(Icons.password),
                    true),
                const SizedBox(
                  height: 20,
                ),
                TextFieldBuilder('Phone Number', TextInputType.number,
                    const Icon(Icons.phone), false),
                const SizedBox(
                  height: 20,
                ),
                TextFieldBuilder('Date of birth', TextInputType.datetime,
                    const Icon(Icons.date_range), false),
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
                    onPressed: () {},
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
