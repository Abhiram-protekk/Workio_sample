import 'package:flutter/cupertino.dart';

class NavItem {
  final String title;
  final IconData icon;
  final bool isActive;
  final IconData filledIcon;

  NavItem({
    required this.title,
    required this.icon,
    this.isActive = true,
    required this.filledIcon,
  });
}