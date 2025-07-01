import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/profilebg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -45,
                  left: 20,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/32.jpg"),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        "Hemant Rangarajan",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blue),
                      ),
                      SizedBox(height: 4),
                      Text("Full-stack Developer",
                          style: TextStyle(color: AppColors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    InfoRow(title: "Name", value: "Hemant Rangarajan"),
                    Divider(
                      thickness: .5,
                    ),
                    InfoRow(title: "Employee ID", value: "EMP00123"),
                    Divider(thickness: .5),
                    InfoRow(title: "Designation", value: "Full-Stack Developer"),
                    Divider(thickness: .5),
                    InfoRow(
                        title: "Department", value: "Software Development Team"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Image.asset("assets/start image.jpg",
                height: MediaQuery.of(context).size.height / 3.6),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: Text("Start work",
                    style: TextStyle(fontSize: 16, color: AppColors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text("$title ",
                style: const TextStyle(fontWeight: FontWeight.bold))),
        Text(":"),
        Expanded(
            flex: 2,
            child: Text(value, style: const TextStyle(color: AppColors.grey))),
      ],
    );
  }
}
