import 'package:flutter/material.dart';

import 'package:ziya_inter_project/view/Home_page.dart';
// check out screen
class Check_Out_FaceVerifiedSuccessScreen extends StatelessWidget {
  const Check_Out_FaceVerifiedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = TimeOfDay.now();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white, // Top white
              Colors.orangeAccent, // Bottom  green gradient
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: const Icon(
                  Icons.check_circle,
                  size: 100,
                  color: Colors.orangeAccent,
                ),onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Check Out Successfully",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent
                
                ),
              ),
              const SizedBox(height: 10),
              Text(// time show
                "at ${now.format(context)}",
                style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
