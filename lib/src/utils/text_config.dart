import 'package:flutter/material.dart';

import 'colour_config.dart';

class TextConfig {
  static TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
  );

  static TextStyle largeText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 30.0,
    color: ColourConfig.defaultAppColour,
  );

  static TextStyle smallText = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
  );

  static TextStyle buttonTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: Colors.white,
  );
}