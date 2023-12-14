import 'package:flutter/material.dart';

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  const CustomBottomNavBarItem({
    required this.initialLocation,
    required super.icon,
    super.label,
    Widget? activeIcon,
  }) : super(activeIcon: activeIcon ?? icon);

  final String initialLocation;
}
