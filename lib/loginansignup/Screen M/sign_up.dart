import 'package:flutter/material.dart';
import 'package:gupshup/loginansignup/Screen%20M/Login.dart';
import 'package:gupshup/loginansignup/Screen%20M/home_screen.dart';
import 'package:gupshup/loginansignup/Services/authentication.dart';
import 'package:gupshup/loginansignup/widgets/snack_bar.dart';

import '../widgets/button.dart';
import '../widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;
  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthServicews().signUpUser(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text
    );
    // if signup is successful, user has been created and navigate to the next screen
    //otherwise show thw error message
    if (res == "success") {

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    }
    else{
      setState(() {
        isLoading=false;
      });
      // show the error message
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: height / 2.7,
              child: Image.asset("images/signup_penguien.png"),
            ),
            TextFieldInpute(
                textEditingController: nameController,
                hintText: "Enter your Name",
                icon: Icons.person),
            TextFieldInpute(
                textEditingController: emailController,
                hintText: "Enter your Email",
                icon: Icons.email),
            TextFieldInpute(
                textEditingController: passwordController,
                hintText: "Enter your password",
                icon: Icons.lock),
            MyButton(onTab: signUpUser, text: "Sign Up"),
            SizedBox(height: height / 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text("Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white)),
                )
              ],
            )
          ],
        ))));
  }
}
