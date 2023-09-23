import 'package:flutter/material.dart';

class DuoColorText extends StatelessWidget {
  const DuoColorText({
    super.key,
    required this.text1,
    required this.text2,
    required this.textColor1,
    required this.textColor2,
    this.weight1 = FontWeight.bold,
    this.weight2 = FontWeight.bold,
    this.size1 = 16,
    this.size2 = 16,
  });

  final String text1;
  final String text2;
  final Color textColor1;
  final Color textColor2;
  final FontWeight weight1;
  final FontWeight weight2;
  final double size1;
  final double size2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
              fontWeight: weight1, fontSize: size1, color: textColor1),
        ),
        Text(
          text2,
          style: TextStyle(
              color: textColor2, fontWeight: weight2, fontSize: size2),
        ),
      ],
    );
  }
}
