import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/about_app.dart';
import 'package:first_project/developer_screen.dart';
import 'package:first_project/login_screen.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? email;

  Future<String?> getCurrentUserEmail() async {
    email = FirebaseAuth.instance.currentUser?.email;
    return null;
  }

  @override
  void initState() {
    getCurrentUserEmail();
    super.initState();
  }

  aboutApp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutApp()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image
                    SizedBox(
                      width: 115,
                      height: 115,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          const CircleAvatar(
                            radius: 4,
                            backgroundImage: AssetImage("assets/images/onboardingImage1.PNG"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -10,
                            child: SizedBox(
                              width: 45,
                              height: 45,
                              child: IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.camera_alt)),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(email ?? "null"),
                    profileMenu(title: "My Account", icon: Icons.account_box, press: () {}),
                    profileMenu(title: "Settings", icon: Icons.settings, press: () {}),
                    profileMenu(title: "About Developer", icon: Icons.person, press: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DeveloperScreen()));
                    }),
                    profileMenu(title: "About E-commerce App", icon: Icons.info, press: aboutApp),
                    profileMenu(title: "Log Out", icon: Icons.logout, press: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                    }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget profileMenu({required String title, required IconData? icon, void Function()? press}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: MaterialButton(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: const Color(0xFFF5F6F9),
          onPressed: press,
          child: Row(
            children: [
              Icon(
                icon,
                size: 22,
                color: Colors.blueAccent,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(child: Text(title)),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      );
}
