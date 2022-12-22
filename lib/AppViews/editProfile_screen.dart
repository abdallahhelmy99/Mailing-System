import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mailing_system/SharedMaterial/shared_widgets.dart';
import '../Classes/User.dart';
import '../SharedMaterial/shared_styles.dart';

class EditProfileScreen extends StatefulWidget {
  User user;
  EditProfileScreen({super.key,required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  User? user;
    @override
  void initState() {
    super.initState();
    user = widget.user;
  }
  SharedWidgets appBarObj = SharedWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: appBarObj.appBar(
            100,
            Text("Profile", style: SharedFonts.primaryStyleStyle),
            null,
            IconButton(
              color: Colors.black,
              icon: const Icon(LineAwesomeIcons.angle_left),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
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
                        const Icon(Icons.abc), "${user!.fname}" ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder(
                        'Last Name', TextInputType.name, const Icon(Icons.abc), "${user!.lname}"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder(
                        'Email Address',
                        TextInputType.emailAddress,
                        const Icon(Icons.alternate_email), "${user!.email}"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder('Phone Number', TextInputType.phone,
                        const Icon(Icons.phone), "${user!.phoneNo}"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder('Password', TextInputType.visiblePassword,
                        const Icon(Icons.password), "${user!.password}"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder(
                        'Confirm Password',
                        TextInputType.visiblePassword,
                        const Icon(Icons.password),"${user!.password}"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldBuilder('Date of birth', TextInputType.datetime,
                        const Icon(Icons.date_range), "${user!.dob}"),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'profile');
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
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}

Widget TextFieldBuilder(String labeltxt, TextInputType x, Icon s,String l) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        initialValue: l,
        decoration: InputDecoration(
            labelText: labeltxt, border: InputBorder.none, suffixIcon: s),
        keyboardType: x,
      ),
    ),
  );
}
