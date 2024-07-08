import 'package:beauty_center/core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarItemActiveIconWidget extends StatelessWidget {
  final String assetName;

  const BottomNavigationBarItemActiveIconWidget({
    super.key,
    required this.assetName,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          assetName,
          // colorFilter:
          //     const ColorFilter.mode(Color(0xFFC38400), BlendMode.srcIn),
          fit: BoxFit.none,
        ),
        Container(
          margin: const EdgeInsets.all(8),
          color: AppColors.lightGoldColor,
          height: 2,
        )
      ],
    );
  }
}
