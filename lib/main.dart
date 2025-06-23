import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/Bottom_navigation.dart';
import 'package:ziya_inter_project/view/ForgotPassword.dart';

import 'package:ziya_inter_project/view/Login.dart';
import 'package:ziya_inter_project/view/Singnup.dart';

import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: AppColors.primaryColor),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Signup(),
        "/Login": (context) => Login(),
        "/Forgot": (context) => ForgotPasswordScreen(),
        "/Bottomnavigation": (context) =>MyHomePage(),
        "/Signup": (context) => Signup(),
      },
    );
  }
}
