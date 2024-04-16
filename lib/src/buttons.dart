import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/src/const.dart';
import 'package:pixel_dat_test_app/src/utils/colour_config.dart';

class Button extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final double? padding;
  const Button({
    super.key,
    required this.child,
    required this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: appBorderRadius,
        splashColor: ColourConfig.blackColour,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: paddingSize * 2),
          decoration: BoxDecoration(
            color: ColourConfig.defaultAppColour.withOpacity(.9),
            borderRadius: appBorderRadius,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
