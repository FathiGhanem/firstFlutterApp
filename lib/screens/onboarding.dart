import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _current = 0;

  final List<String> _images = const [
    "assets/images/splash_1.png",
    "assets/images/splash_2.png",
    "assets/images/splash_3.png",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Column(
                children: [
                  Text(
                    "TOKOTO",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Welcome to Tokoto. Let's shop!",
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _images.length,
                  onPageChanged: (i) => setState(() => _current = i),
                  itemBuilder: (_, i) =>
                      Image.asset(_images[i], fit: BoxFit.contain),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _images.length,
                  (i) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 10,
                    width: _current == i ? 24 : 10,
                    decoration: BoxDecoration(
                      color: _current == i
                          ? theme.primaryColor
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final isLast = _current == _images.length - 1;
                    if (!isLast) {
                      _pageController.jumpToPage(_current + 1);
                    } else {
                      Navigator.pushNamed(context, '/sign-in');
                    }
                  },
                  child: Text(
                    _current == _images.length - 1 ? "Get Started" : "Continue",
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
