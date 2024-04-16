import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/src/const.dart';
import 'package:pixel_dat_test_app/src/utils/colour_config.dart';

class ProfileCircle extends StatelessWidget {
  const ProfileCircle({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingSize * 4,
        bottom: paddingSize * 8,
      ),
      child: Center(
        child: SizedBox(
          height: size,
          width: size,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                radius: size,
              ),
              Positioned(
                bottom: 0,
                right: -defaultSize * 0.8,
                child: RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: ColourConfig.defaultAppColour,
                  padding: EdgeInsets.all(paddingSize),
                  shape: const CircleBorder(),
                  child: const Icon(Icons.edit_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
