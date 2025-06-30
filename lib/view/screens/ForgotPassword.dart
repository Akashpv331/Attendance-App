import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/screens/Login.dart';




class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
// email validation
  bool isValidEmail(String email) {
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
  }
//  function
  Future<void> resetPassword() async {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      showMessage("Please enter your email.");
      return;
    }

    if (!isValidEmail(email)) {
      showMessage("Please enter a valid email address.");
      return;
    }

    try {
      setState(() => isLoading = true);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showMessage("Password reset link sent! Check your email.");
    } on FirebaseAuthException catch (e) {
      showMessage(e.message ?? "Firebase error occurred.");
    } catch (e) {
      showMessage("Something went wrong. Please try again.");
    }

    setState(() => isLoading = false);
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:  AppColors.blue,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 6, 34, 83)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Enter your registered email address",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        ),
                  ), Text(
                    "to reset your password",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        ),),
                  
                  
                  SizedBox(height: 10,),
                
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: "Enter your registered email",
                    
                  ),
                ),
                SizedBox(height: 20),
                 SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: ElevatedButton(
                    child: Text('Sign Up'),
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
                      //  function call
                      resetPassword();
                    },
                  ),
                ),SizedBox(height: 10,),
                TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: AppColors.green, fontSize: 16),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
