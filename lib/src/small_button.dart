import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/src/utils/text_config.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final double? fontSize;
  final void Function() onTap;

  const SmallButton({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(5.0),
          splashColor: const Color(0XFF000000),
          onTap: onTap,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            height: 36.0,
            decoration: BoxDecoration(
              color: const Color(0XFF005099).withAlpha(240),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Text(
                text,
                style: TextConfig.textStyle.copyWith(
                    fontSize: fontSize ?? 12.0, color: const Color(0XFFFFFFFF)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
