import 'package:e_commerceapp/routing.dart';
import 'package:e_commerceapp/widgets/common.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Welcome Back",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Sign in with your email and password",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "or continue with social media",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InputApp(
                        label: "Email",
                        hint: "Enter Your Email",
                        icon: Icons.email_outlined,
                      ),
                      InputApp(
                        label: "Password",
                        hint: "Enter Your Password",
                        icon: Icons.lock_clock_outlined,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: Row(
                          children: [
                            CheckBoxTile(),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.forgot);
                              },
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ContinueB(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.otp),
                      ),
                    ],
                  ),
                ),
                Column(children: [SocialIconsRow(), DontHaveAcc()]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckBoxTile extends StatefulWidget {
  const CheckBoxTile({super.key});
  
  @override
  State<CheckBoxTile> createState() => _CheckBoxTileState();
}

class _CheckBoxTileState extends State<CheckBoxTile> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CheckboxListTile(
        value: rememberMe,
        onChanged: (v) => setState(() => rememberMe = v ?? false),
        title: const Text("Remember me"),
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
      ),
    );
  }
}
