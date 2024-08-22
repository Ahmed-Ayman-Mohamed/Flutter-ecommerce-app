import 'package:first_project/about_app.dart';
import 'package:first_project/api/api_provider.dart';
import 'package:first_project/bottom_nav_screens/cart_screen.dart';
import 'package:first_project/bottom_nav_screens/home_screen.dart';
import 'package:first_project/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'bottom_nav_screens/user_profile.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key,});
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List screens = [const HomeScreen(), const CartScreen(), const UserProfile()];

  int get getSelectedIndex=> selectedIndex;
  set setSelectedIndex(int value){
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ApiProvider().getProducts();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.1),
          ),
        ]),
        child:  SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.blueAccent,
            color: Colors.black,
            tabs: const [
            GButton(icon: LineIcons.home, text: "Home"),
            GButton(icon: LineIcons.shoppingCart, text: "Cart"),
            GButton(icon: LineIcons.user, text: "Profile"),
          ],
          selectedIndex: selectedIndex,
          onTabChange: (index){
            setState(() {
              selectedIndex = index;
            });
          },

          ),
        )),
      ),
    );
  }
}
