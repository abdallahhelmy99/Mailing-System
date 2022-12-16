import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mailing_system/SharedMaterial/shared_colors.dart';
import 'package:mailing_system/SharedMaterial/shared_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: AppColors.primaryColor),
          elevation: 0.0,
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(LineAwesomeIcons.angle_left),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text("Profile", style: SharedFonts.primaryStyleStyle),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
                  color: Colors.black,
                ))
          ]),
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
                              LineAwesomeIcons.alternate_pencil,
                              size: 20,
                              color: Colors.white,
                            )),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Username",
                style: SharedFonts.primaryStyleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "abcd@gmail.com",
                style: SharedFonts.smallStyle,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'editprofile');
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const EditProfileScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 280,
              ),
              ListTile(
                title: const Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cabin'),
                ),
                leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      LineAwesomeIcons.alternate_sign_out,
                    )),
                textColor: Colors.red,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
