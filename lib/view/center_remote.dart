import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/check_in_succes.dart';
import 'package:ziya_inter_project/view/check_out_success.dart';

class CenterFaceCaptureScreen extends StatelessWidget {
  final bool isCheckIn;

  const CenterFaceCaptureScreen({super.key, required this.isCheckIn});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: size.height * 0.65,
                width: double.infinity,
                color: AppColors.white),
            Expanded(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.white, AppColors.blue],
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
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      AppText.instruction,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Camera icon
                        const CircleAvatar(
                          backgroundColor: AppColors.white,
                          child: Icon(Icons.camera_alt_rounded,
                              color: AppColors.black),
                        ),

                        Material(
                          color: Colors.transparent,
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 100));
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
                                color: AppColors.blue,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: AppColors.white,
                                size: 32,
                              ),
                            ),
                          ),
                        ),

                        // Flash icon
                        const CircleAvatar(
                          backgroundColor: AppColors.white,
                          child: Icon(Icons.flash_on, color: AppColors.black),
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
