

import 'package:flutter/material.dart';

import 'package:ziya_inter_project/view/check_in_succes.dart';
import 'package:ziya_inter_project/view/check_out_success.dart';

class CenterFaceCaptureScreen extends StatelessWidget {
  final bool isCheckIn;

  const CenterFaceCaptureScreen({super.key, required this.isCheckIn});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFEEF4FC),
      body: SafeArea(
        child: Column(
          children: [
            // Top face camera area
            Container(
              height: size.height * 0.65,
              width: double.infinity,
              color: Colors.white,
              // You can insert the camera widget here later
            ),

            // Bottom instruction & control section
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Color(0xFF2196F3), // Blue
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Center your face",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Point your face right at the box,\nthen take a photo",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Action buttons: flash, capture, flip
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // camera icon
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.camera_alt_rounded, color: Colors.black),
                        ),

                        // Camera capture button
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => isCheckIn
                                    ? const Check_in_FaceVerifiedSuccessScreen()
                                    : const Check_Out_FaceVerifiedSuccessScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: const Icon(Icons.check,
                                color: Colors.white, size: 32),
                          ),
                        ),

                        // Flash icon
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.flash_on,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
