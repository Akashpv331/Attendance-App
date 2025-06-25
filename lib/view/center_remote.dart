

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/check_in_succes.dart';
import 'package:ziya_inter_project/view/check_out_success.dart';

class CenterFaceCaptureScreen extends StatefulWidget {
  final bool isCheckIn;

  const CenterFaceCaptureScreen({super.key, required this.isCheckIn});

  @override
  State<CenterFaceCaptureScreen> createState() =>
      _CenterFaceCaptureScreenState();
}

class _CenterFaceCaptureScreenState extends State<CenterFaceCaptureScreen> {
  CameraController? cameraController;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    cameraController =
        CameraController(cameras[1], ResolutionPreset.medium); 
    await cameraController!.initialize();
    if (mounted) {
      setState(() => isCameraInitialized = true);
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Live Camera Preview
            Container(
              height: size.height * 0.65,
              width: double.infinity,
              color: AppColors.white,
              child: isCameraInitialized
                  ? CameraPreview(cameraController!)
                  : const Center(child: CircularProgressIndicator()),
            ),

            // Bottom section with instructions and buttons
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.white, AppColors.blue],
                  ),
                ),
                child: Column(
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
                              if (cameraController != null &&
                                cameraController!.value.isInitialized) {
                                await cameraController!.takePicture();
                              }

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => widget.isCheckIn
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
