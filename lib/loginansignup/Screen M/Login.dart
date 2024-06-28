// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupshup/loginansignup/Screen%20M/sign_up.dart';
import 'package:gupshup/loginansignup/widgets/button.dart';
import 'package:gupshup/loginansignup/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
              child:SingleChildScrollView(
                child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: height / 2.7,
              child: Image.asset("images/login_girl.png"),
            ),
            TextFieldInpute(
                textEditingController: emailController,
                hintText: "Enter your Email",
                icon: Icons.email),
            TextFieldInpute(
                textEditingController: passwordController,
                hintText: "Enter your password",
                icon: Icons.password),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue),
                ),
              ),
            ),
            MyButton(onTab: () {}, text: "Log In"),
             // ElevatedButton(onPressed: (){}, child:Text("Login In")),
             SizedBox(height: height /15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?",style: TextStyle(fontSize: 16,color: Colors.white)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                    );
                  },
                  child: const Text("SignUp",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,color: Colors.white
                      )),
                )
              ],
            )
          ],
        ))));
  }
}
