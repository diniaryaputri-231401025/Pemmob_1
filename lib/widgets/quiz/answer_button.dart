// lib/widgets/quiz/answer_button.dart
import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';

// Tombol Khusus Jawaban
class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;

  const AnswerButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        color: backgroundColor,
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
            child: Text(
              text,
              style: getTextStyle(context, scale: 1.1, weight: FontWeight.bold)
                  .copyWith(color: textColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}