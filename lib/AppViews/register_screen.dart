import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mailing_system/SharedMaterial/shared_styles.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  SharedWidgets appBarObj = SharedWidgets();
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
