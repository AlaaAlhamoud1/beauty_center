import 'package:beauty_center/core/values/values.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final Function(int)? onTap;
  final int currentIndex;

  const BottomNavigationBarWidget(
      {Key? key, required this.items, this.onTap, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGreyColor,
      child: BottomNavigationBar(
        items: items,
        onTap: onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
      ),
    );
  }
}
