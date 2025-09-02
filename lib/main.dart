import 'package:e_commerceapp/screens/complete_profile.dart';
import 'package:e_commerceapp/screens/forgot_password.dart';
import 'package:e_commerceapp/screens/home.dart';
import 'package:e_commerceapp/screens/otp.dart';
import 'package:e_commerceapp/screens/register.dart';
import 'package:e_commerceapp/screens/sign_in.dart';
import 'package:e_commerceapp/screens/onboarding.dart';
import 'package:flutter/material.dart';

import 'routing.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Muli"),

      initialRoute: Routes.onboarding,

      routes: {
        Routes.onboarding: (_) => Onboarding(),
        Routes.signIn: (_) => SignIn(),
        Routes.register: (_) => Register(),
        Routes.forgot: (_) => ForgotPassword(),
        Routes.otp: (_) => Otp(),
        Routes.completeProfile: (_) => CompleteProfile(),
        Routes.home: (_) => Home(),
      },
    );
  }
}
