import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../SharedMaterial/shared_colors.dart';
import '../SharedMaterial/shared_styles.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: AppColors.primaryColor),
          elevation: 0.0,
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(LineAwesomeIcons.angle_left),
            onPressed: () {
              Navigator.pushNamed(context, 'profile');
            },
          ),
          centerTitle: true,
          title: Text("Profile", style: SharedFonts.primaryStyleStyle),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage('assets/images/profile.png')),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.black,
                          ),
                          child: IconButton(
                              color: Colors.black,
                              onPressed: () {},
                              icon: const Icon(
                                LineAwesomeIcons.camera,
                                size: 20,
                                color: Colors.white,
                              )),
                        ))
                  ],
                ),
                const SizedBox(height: 50),
                Form(
                    child: Column(
                  children: [
                    TextFieldBuilder('First Name', TextInputType.name,
                        const Icon(Icons.abc)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder(
                        'Last Name', TextInputType.name, const Icon(Icons.abc)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder(
                        'Email Address',
                        TextInputType.emailAddress,
                        const Icon(Icons.alternate_email)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder('Phone Number', TextInputType.phone,
                        const Icon(Icons.phone)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder('Password', TextInputType.visiblePassword,
                        const Icon(Icons.password)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder(
                        'Confirm Password',
                        TextInputType.visiblePassword,
                        const Icon(Icons.password)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder('Date of birth', TextInputType.datetime,
                        const Icon(Icons.date_range)),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,)
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}

Widget TextFieldBuilder(String labeltxt, TextInputType x, Icon s) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: labeltxt, border: InputBorder.none, suffixIcon: s),
        keyboardType: x,
      ),
    ),
  );
}
