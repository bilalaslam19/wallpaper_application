import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Wallpaper',
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)
          ),
          TextSpan(
            text: ' App',   style: TextStyle(color: Colors.orangeAccent, fontSize: 20, fontWeight: FontWeight.w600)
          )
        ]
      ),
    );
  }
}
