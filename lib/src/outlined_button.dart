import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/src/const.dart';
import 'package:pixel_dat_test_app/src/utils/colour_config.dart';

class ButtonOutlined extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final Color? borderColour;
  const ButtonOutlined({
    super.key,
    required this.child,
    required this.onTap,
    this.borderColour,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: appBorderRadius,
        splashColor: ColourConfig.opaqueAppColour,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: paddingSize * 2),
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColour ?? ColourConfig.defaultAppColour,
              width: borderWidth,
            ),
            borderRadius: appBorderRadius,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
