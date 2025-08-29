import 'package:e_commerceapp/routing.dart';
import 'package:e_commerceapp/widgets/common.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                    Text("Fortgot Password", style: theme.textTheme.titleLarge),
                    Text(
                      "please enter your email and we will send",
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      "you a link to return to your account",
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
                InputApp(
                  label: "Email",
                  hint: "Enter Your Email",
                  icon: Icons.email_outlined,
                ),
                SizedBox(width: double.infinity,child: ContinueB(
                  onPressed: (){
                    Navigator.pushNamed(context, Routes.otp);
                  },
                )),
                DontHaveAcc()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
