


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ziya_inter_project/view/center_remote.dart';

// remote face verification
class FaceverificationScreen extends StatefulWidget {
  final bool isCheckIn;
  FaceverificationScreen({super.key, required this.isCheckIn});

  @override
  State<FaceverificationScreen> createState() => _FaceverificationScreenState();
}

class _FaceverificationScreenState extends State<FaceverificationScreen> {
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
        builder: (_) => CenterFaceCaptureScreen(
          isCheckIn: widget.isCheckIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Title and subtitle
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Face Verification",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text("Please capture your face"),
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
                    "assets/face verification animation.json",
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
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      "Take Photo",
                      style: TextStyle(color: Colors.white),
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
