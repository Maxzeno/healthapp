import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/src/const.dart';
import 'package:pixel_dat_test_app/src/utils/colour_config.dart';

class CustomDropdownTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final List<DropdownMenuItem<Object>>? items;
  const CustomDropdownTextField({
    super.key,
    required this.hintText,
    this.items,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField(
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: ColourConfig.blackColour,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(paddingSize * 1.7),
          filled: true,
          fillColor: ColourConfig.greyColour,
          border: const OutlineInputBorder(),
          label: Text(label),
          hintText: hintText,
        ),
        items: items,
        onChanged: (value) {
          // TODO: Create the necessary function
        },
      ),
    );
  }
}
