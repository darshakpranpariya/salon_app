import 'package:flutter/material.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Image.asset(
            "assets/salon_logo_2.png",
            height: getSize(50),
          ),
        ],
      ),
    );
  }
}
