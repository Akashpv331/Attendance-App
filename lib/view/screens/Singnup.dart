import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/controller/auth_service.dart';
import 'package:ziya_inter_project/view/screens/Bottom_navigation.dart';
import 'package:ziya_inter_project/view/screens/Login.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =  TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool passwordVisible = false;
  bool isLoading = false;
// add data in firebase 
  Future<void> addUserData() async {
    if (!validateFields()) return;

    setState(() => isLoading = true);

    try {
      // email and password created
      String result = await AuthserviceHelper.createAccount(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (result == "Account Created") {
        // add data
        await FirebaseFirestore.instance.collection('UserDetails').add({
          'name': usernameController.text.trim(),
          'userPassword': passwordController.text.trim(),
          'userEmail': emailController.text.trim(),
          'userPhone': phoneNumberController.text.trim(),
        });

        clearFields();
        if (!mounted) return;
        // navigate home
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
          (route) => false,
        );
      } else {
        showError(result);
      }
    } catch (e) {
      showError("Failed to add user data!");
    }

    setState(() => isLoading = false);
  }

//  field validation
  validateFields() {
    if (usernameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      showError("All fields are required.");
      return false;
    }
    if (!validateEmail(emailController.text)) {
      showError("Invalid email format.");
      return false;
    }
    if (!validatePhone(phoneNumberController.text)) {
      showError("Phone number must be 10 digits.");
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      showError("Passwords do not match.");
      return false;
    }
    return true;
  }
  //  clear fields
  void clearFields() {
    usernameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
//  email validation
  validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }
//  phone no validation
  validatePhone(String phone) {
    return RegExp(r"^\d{10}$").hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ZiyaAttend",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Create an account",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 50, 154, 54)),
                ),
                const SizedBox(height: 10),
                //  widget Call
                CustomTextField(
                    usernameController, "Username", "Enter a valid username"),
                const SizedBox(height: 10),
                CustomTextField(phoneNumberController, "Phone Number",
                    "Enter a valid phone number"),
                const SizedBox(height: 10),
                CustomTextField(emailController, "Email", "Enter a valid email",
                    TextInputType.emailAddress),
                const SizedBox(height: 10),
                CustomPasswordField(
                    passwordController, "Password", "Enter a strong password"),
                const SizedBox(height: 10),
                CustomPasswordField(confirmPasswordController,
                    "Confirm Password", "Re-enter password"),
                const SizedBox(height: 20),
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
                      //  add function call
                      addUserData();
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(fontSize: 16)),
                    TextButton(
                      // navigate login
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
//  custom textfield widget
  Widget CustomTextField(
      TextEditingController controller, String label, String hint,
      [TextInputType inputType = TextInputType.text]) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        hintText: hint,
      ),
    );
  }
//  custom password widget
  Widget CustomPasswordField(
      TextEditingController controller, String label, String hint) {
    return TextField(
      controller: controller,
      obscureText: !passwordVisible,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        hintText: hint,
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() => passwordVisible = !passwordVisible),
        ),
      ),
    );
  }
}
