import 'package:e_commerceapp/routing.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  CarouselSliderController controller = CarouselSliderController();
  int current = 0;

  List images = [
    "assets/images/splash_1.png",
    "assets/images/splash_2.png",
    "assets/images/splash_3.png",
  ];

  @override
  Widget build(BuildContext context) {
    bool isLast = current == images.length - 1;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "TOKOTO",
                  style: TextStyle(
                    color: Color(0xFFFF7643),
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Welcome to Tokoto, Let's shop!",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),

            Column(
              children: [
                CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 320,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    viewportFraction: 0.85,
                    onPageChanged: (index, reason) {
                      setState(() => current = index);
                    },
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (i) {
                    bool active = i == current;
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: active ? 22 : 8,
                      decoration: BoxDecoration(
                        color: active ? Color(0xFFFF7643) : Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  }),
                ),
              ],
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF7643),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  if (isLast) {
                    Navigator.pushReplacementNamed(context, Routes.signIn);
                  } else {
                    controller.nextPage();
                  }
                },
                child: Text(
                  isLast ? "Get Started" : "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
