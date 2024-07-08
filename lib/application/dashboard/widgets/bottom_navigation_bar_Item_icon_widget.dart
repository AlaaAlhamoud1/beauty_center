import 'package:beauty_center/core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarItemIconWidget extends StatelessWidget {
  final String assetName;

  // final String name;
  const BottomNavigationBarItemIconWidget({
    super.key,
    required this.assetName,
    // required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(assetName, color: AppColors.darkGreyColor),
      ],
    );
  }
}
