import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/screens/Home_page.dart';


class Check_in_FaceVerifiedSuccessScreen extends StatelessWidget {
  const Check_in_FaceVerifiedSuccessScreen({super.key});

  Future<void> saveCheckInTime(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final timeString =
        "${now.day}-${now.month}-${now.year} ${TimeOfDay.now().format(context)}";
    await prefs.setString('check in time', timeString);
  }

  @override
  Widget build(BuildContext context) {
    final now = TimeOfDay.now();

    saveCheckInTime(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.white,
              AppColors.insuccessbg,
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
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Punch Registered Successfully",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.green,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "at ${now.format(context)}",
                style: const TextStyle(
                  color: AppColors.green,
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
