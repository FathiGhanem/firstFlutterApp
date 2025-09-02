import 'package:e_commerceapp/routing.dart';
import 'package:e_commerceapp/widgets/common.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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
                      "OTP Verification",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("We Sent your code to +1 898 860 ***"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "This code will expired in ",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "00:13",
                          style: TextStyle(color: Color(0xFFFF7643)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [OtpBox(), OtpBox(), OtpBox(), OtpBox()],
                  ),
                ),

                ContinueB(
                  onPressed: () => Navigator.pushNamed(context, Routes.home),
                ),
                Resnd(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpBox extends StatefulWidget {
  const OtpBox({super.key});

  @override
  State<OtpBox> createState() => _OtpBoxState();
}

class _OtpBoxState extends State<OtpBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}

class Resnd extends StatefulWidget {
  const Resnd({super.key});

  @override
  State<Resnd> createState() => _ResndState();
}

class _ResndState extends State<Resnd> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text("Resend OTP Code", style: TextStyle(color: Colors.black)),
    );
  }
}
