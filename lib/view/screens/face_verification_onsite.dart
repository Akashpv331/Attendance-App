
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/screens/center_face_onsite.dart';
import 'package:ziya_inter_project/view/screens/center_remote.dart';

// on site  face verification
class Onsite_FaceverificationScreen extends StatefulWidget {
  final bool isCheckIn;
  Onsite_FaceverificationScreen({super.key, required this.isCheckIn});

  @override
  State<Onsite_FaceverificationScreen> createState() => _Onsite_FaceverificationScreenState();
}

class _Onsite_FaceverificationScreenState extends State<Onsite_FaceverificationScreen> {
  bool showText = true;

  void _onTakePhoto() async {
    setState(() {
      showText = false;
    });

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OnSite_CenterFaceCaptureScreen(
          isCheckIn: widget.isCheckIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
           
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "QR Verification",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text("Please capture your Qr"),
                      ],
                    ),
                  ],
                ),
              ),

              // Lottie animation
              Center(
                child: Container(
                  width: size.width * 0.4,
                  height: size.width * 0.4,
                  child: Lottie.asset( 
                    "assets/Qr code animation.json.json",
                    repeat: true,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Failed to load animation');
                    },
                  ),
                ),
              ),

              // Take Photo button
              InkWell(
                onTap: _onTakePhoto,
                child: Container(
                  height: 40,
                  width: size.width / 1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  AppColors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      "Take Photo",
                      style: TextStyle(color:  AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
