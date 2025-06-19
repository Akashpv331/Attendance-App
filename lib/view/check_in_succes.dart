import 'package:flutter/material.dart';

import 'package:ziya_inter_project/view/Home_page.dart';

// check_in success page
class Check_in_FaceVerifiedSuccessScreen extends StatelessWidget {
  const Check_in_FaceVerifiedSuccessScreen({super.key});

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
              Colors.white, // Top: white
              Colors.lightGreenAccent, // Bottom: green gradient
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
                  color: Color.fromARGB(255, 54, 211, 59),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Punch Registered Successfully",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              const SizedBox(height: 10),
              Text(
                // time show
                "at ${now.format(context)}",
                style: const TextStyle(
                  color: Colors.green,
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
