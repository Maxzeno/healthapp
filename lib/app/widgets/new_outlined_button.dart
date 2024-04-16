import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pixel_dat_test_app/src/const.dart';
import 'package:pixel_dat_test_app/src/outlined_button.dart';
import 'package:pixel_dat_test_app/src/utils/text_config.dart';

class NewOutlinedButton extends StatelessWidget {
  final Color? iconColor;
  final IconData? icon;
  final void Function() onTap;
  const NewOutlinedButton({
    super.key,
    this.iconColor,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ButtonOutlined(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue with",
              style: TextConfig.smallText.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: paddingSize),
            FaIcon(
              icon,
              color: iconColor,
              size: defaultSize / 2,
            ),
          ],
        ),
      ),
    );
  }
}
