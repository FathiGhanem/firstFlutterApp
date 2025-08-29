import 'package:e_commerceapp/routing.dart';
import 'package:e_commerceapp/widgets/common.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(22.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Complete Profile" , style: Theme.of(context).textTheme.titleLarge,),
                  Text("Complete your details or continue" , style: Theme.of(context).textTheme.titleMedium,),
                  Text("with social media" , style: Theme.of(context).textTheme.titleMedium,),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  InputApp(label: "First Name", hint: "Enter your first name", icon: Icons.person_3_outlined),
                  InputApp(label: "Last Name", hint: "Enter your last name", icon: Icons.person_3_outlined),
                  InputApp(label: "Phone Number", hint: "Enter your phone number", icon: Icons.phone_android),
                  InputApp(label: "Address", hint: "Enter your address", icon: Icons.aspect_ratio),
                ContinueB(
                  onPressed: (){
                   Navigator.pushNamed(context, Routes.otp);  
                  },
                ),
                ],),
              ),

              Column(
                children: [
                  Text("By continuing your confirm that you agree" , style: Theme.of(context).textTheme.labelSmall,),
                  Text("with our Term and Conditon" , style: Theme.of(context).textTheme.labelSmall),
                ],
              )
            ],
          ),
        ),
      )
      ),
    );
  }
}