import 'package:e_commerceapp/routing.dart';
import 'package:e_commerceapp/widgets/common.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Register Account",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Complete your details or continue"),
                    Text("with social media"),
                  ],
                ),

                SizedBox(
                  height: 405,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InputApp(
                        label: "Email",
                        hint: "Enter your email",
                        icon: Icons.email_outlined,
                      ),
                      InputApp(
                        label: "Password",
                        hint: "Enter your password",
                        icon: Icons.lock_outline_rounded,
                      ),
                      InputApp(
                        label: "Confirm Password",
                        hint: "Re-enter your password",
                        icon: Icons.lock_outline_rounded,
                      ),
                      ContinueB(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          Routes.completeProfile,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    SocialIconsRow(),
                    Text(
                      "By continuing your confirm that you agree",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
