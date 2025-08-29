import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Continue", style: TextStyle(color: Colors.white)),
    );
  }
}

class InputApp extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  

  const InputApp({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
  });

  @override
  State<InputApp> createState() => _InputAppState();
}

class _InputAppState extends State<InputApp> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          suffixIcon: Icon(widget.icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 26,
          ),
        ),
      ),
    );
  }
}

class ContinueB extends StatelessWidget {
  final VoidCallback onPressed; 

  const ContinueB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed, 
        child: const Text("Continue"),
      ),
    );
  }
}

class DontHaveAcc extends StatefulWidget {
  const DontHaveAcc({super.key});

  @override
  State<DontHaveAcc> createState() => _DontHaveAccState();
}

class _DontHaveAccState extends State<DontHaveAcc> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Dont Have an account?"),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text("Sign Up", style: TextStyle(color: theme.primaryColor)),
          ),
        ],
      ),
    );
  }
}

class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon("assets/icons/google-icon.svg"),
        const SizedBox(width: 20),
        _buildSocialIcon("assets/icons/facebook-2.svg"),
        const SizedBox(width: 20),
        _buildSocialIcon("assets/icons/twitter.svg"),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade100,
      ),
      child: SvgPicture.asset(assetPath, height: 24, width: 24),
    );
  }
}
