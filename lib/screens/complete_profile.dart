import 'package:e_commerceapp/routing.dart';
import 'package:e_commerceapp/widgets/common.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final _formKey = GlobalKey<FormState>();

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
                      "Complete Profile",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Complete your details or continue"),
                    Text(
                      "with social media",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InputApp(
                          label: "First Name",
                          hint: "Enter your first name",
                          icon: Icons.person_3_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter valid Name ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        InputApp(
                          label: "Last Name",
                          hint: "Enter your last name",
                          icon: Icons.person_3_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter valid Name ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        InputApp(
                          label: "Phone Number",
                          hint: "Enter your phone number",
                          icon: Icons.phone_android,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter valid Number ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        InputApp(
                          label: "Address",
                          hint: "Enter your address",
                          icon: Icons.aspect_ratio,
                          validator: (value) {
                            return null;
                          },
                        ),
                        ContinueB(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, Routes.otp);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                Column(
                  children: [
                    Text("By continuing your confirm that you agree"),
                    Text("with our Term and Conditon"),
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
