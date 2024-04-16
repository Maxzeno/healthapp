import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/src/const.dart';
import 'package:pixel_dat_test_app/src/utils/colour_config.dart';
import 'package:pixel_dat_test_app/src/utils/text_config.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final Icon? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final void Function()? onPressed;
  final TextEditingController? textController;
  final String? initialValue;
  final bool? readOnly;
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onPressed,
    this.textController,
    this.initialValue,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: defaultSize / 2),
      child: TextFormField(
        obscureText: obscureText ?? false,
        controller: textController,
        initialValue: initialValue,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColourConfig.greyColour,
          border: const OutlineInputBorder(),
          contentPadding: EdgeInsets.all(paddingSize * 1.7),
          label: Text(
            label,
            style: TextConfig.smallText,
          ),
          labelStyle: TextConfig.textStyle.copyWith(
            fontWeight: FontWeight.w300,
          ),
          hintText: hintText,
          hintStyle: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w300),
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
