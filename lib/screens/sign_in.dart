import 'package:e_commerceapp/routing.dart';
import 'package:e_commerceapp/widgets/common.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(22.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign in with your email and password",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    Text(
                      "or continue with social media",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InputApp(
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
                        InputApp(
                          label: "Password",
                          hint: "Enter Your Password",
                          icon: Icons.lock_clock_outlined,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 7) {
                              return "Enter valid Password";
                            } else {
                              return null;
                            }
                          },
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, Routes.home);
                            }
                          },
                        ),
                      ],
                    ),
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
        title: Text("Remember me"),
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
      ),
    );
  }
}
