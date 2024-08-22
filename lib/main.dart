import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/home_layout.dart';
import 'package:first_project/models/cart_model.dart';
import 'package:first_project/onboarding_screen.dart';
import 'package:first_project/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme.copyWith(
          //colorScheme: theme.colorScheme.copyWith(secondary: const Color(0xFFFEF9EB)),
          primaryColor: Colors.yellow,
          secondaryHeaderColor: const Color(0xFFFEF9EB),
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}
