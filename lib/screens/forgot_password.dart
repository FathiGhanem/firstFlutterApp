import 'package:e_commerceapp/routing.dart';
import 'package:e_commerceapp/widgets/common.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Forgot  Password",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("please enter your email and we will send"),
                    Text("you a link to return to your account"),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: InputApp(
                    label: "Email",
                    hint: "Enter Your Email",
                    icon: Icons.email_outlined,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return "Enter valid Email ";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ContinueB(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, Routes.otp);
                      }
                    },
                  ),
                ),
                DontHaveAcc(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
