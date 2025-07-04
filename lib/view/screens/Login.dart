import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/controller/auth_service.dart';
import 'package:ziya_inter_project/view/screens/Bottom_navigation.dart';
import 'package:ziya_inter_project/view/screens/ForgotPassword.dart';
import 'package:ziya_inter_project/view/screens/Singnup.dart';


// Login page
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ZiyaAttend",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Smart Attendance Maintainer",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 29, 156, 34)),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter your email (eg : abc@gmail.com)',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter your password',
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
              width: MediaQuery.of(context).size.width / 1.1,
              child: ElevatedButton(
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 24, 123, 194),
                  foregroundColor: AppColors.white,  
                  textStyle: const TextStyle(
                    color: AppColors.white,
                    fontSize: 10,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onPressed: () {
                  // login function call
                  loginUser();
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      // navigate forgotpassword
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 108, 178, 231),
                          fontSize: 16),
                    )),
                TextButton(
                  // navigate signup
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color:AppColors.green, fontSize: 16),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
//  login function
  Future<void> loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showError("Please fill in all fields");
      return;
    }

    String result = await AuthserviceHelper.loginAccount(email, password);
    if (result == "Login Successfully") {
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
          (route) => false);
    } else {
      showError(result);
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.red),
    );
  }
}
