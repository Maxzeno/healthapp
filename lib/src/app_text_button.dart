import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/src/theme.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.text,
      this.textColor,
      this.onPressed,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w500,
      this.isUnderlined});

  final Color? textColor;
  final Function()? onPressed;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final bool? isUnderlined;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor ?? appColors.purple,
          decoration: (isUnderlined ?? false)
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
      ),
    );
  }
}

class AppRichTextButton extends StatelessWidget {
  const AppRichTextButton({
    super.key,
    required this.highLightedText,
    required this.text,
    this.onTap,
  });

  final String text;
  final String highLightedText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: TextStyle(
                color: appColors.purple.withOpacity(.3),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: highLightedText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: appColors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
