import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/src/theme.dart';
import 'package:pixel_dat_test_app/src/utils/colour_config.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    this.buttonColor,
    this.onPressed,
    this.isOutlined = false,
    this.borderColor,
    this.textColor,
    required this.buttonText,
    this.height = 45,
    this.width,
    this.tapTargetSize,
    this.loading = false,
  });

  final Function()? onPressed;
  final String buttonText;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final bool isOutlined;
  final double height;
  final double? width;
  final MaterialTapTargetSize? tapTargetSize;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? appColors.purple,
        elevation: 0,
        side: isOutlined
            ? BorderSide(
                color: borderColor ?? appColors.purple,
              )
            : BorderSide.none,
        minimumSize: const Size(250 ?? double.infinity, 50),
        tapTargetSize: tapTargetSize,
      ),
      onPressed: loading ? null : onPressed,
      child: loading
          ? CircularProgressIndicator(
              color: ColourConfig.whiteColour,
            )
          : Text(
              buttonText,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: textColor ?? appColors.white,
              ),
            ),
    );
  }
}
