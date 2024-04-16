import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/src/const.dart';
import 'package:pixel_dat_test_app/src/outlined_button.dart';
import 'package:pixel_dat_test_app/src/utils/colour_config.dart';
import 'package:pixel_dat_test_app/src/utils/text_config.dart';

class OutlinedIconButton extends StatelessWidget {
  const OutlinedIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData? icon;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonOutlined(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColourConfig.defaultAppColour,
            ),
            SizedBox(
              width: paddingSize,
            ),
            Text(
              text,
              style: TextConfig.buttonTextStyle.copyWith(
                color: ColourConfig.blackColour,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
