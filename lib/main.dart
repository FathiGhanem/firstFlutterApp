import 'package:e_commerceapp/screens/complete_profile.dart';
import 'package:e_commerceapp/screens/forgot_password.dart';
import 'package:e_commerceapp/screens/home.dart';
import 'package:e_commerceapp/screens/otp.dart';
import 'package:e_commerceapp/screens/register.dart';
import 'package:e_commerceapp/screens/sign_in.dart';
import 'package:e_commerceapp/screens/onboarding.dart';
import 'package:e_commerceapp/theme.dart';
import 'package:flutter/material.dart';

import 'routing.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,

      initialRoute: Routes.onboarding,

      routes: {
        Routes.onboarding: (_) => const Onboarding(),
        Routes.signIn: (_) => const SignIn(),
        Routes.register: (_) => const Register(),
        Routes.forgot: (_) => const ForgotPassword(),
        Routes.otp: (_) => const Otp(),
        Routes.completeProfile: (_) => const CompleteProfile(),
        Routes.home: (_) => const Home(),
      },
    );
  }
}
