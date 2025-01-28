import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../models/nav_items.dart';

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  final List<NavItem> navItems = [
    NavItem(
      title: 'Home',
      icon: PhosphorIcons.house,
      filledIcon: PhosphorIcons.house_fill,
    ),
    NavItem(
      title: 'Notifications',
      icon: PhosphorIcons.chat_text,
      filledIcon: PhosphorIcons.chat_text_fill,
    ),
    NavItem(
      title: 'Location',
      icon: PhosphorIcons.map_pin,
      filledIcon: PhosphorIcons.map_pin_fill,
    ),
    NavItem(
      title: 'Liked',
      icon: PhosphorIcons.heart,
      filledIcon: PhosphorIcons.heart_fill,
    ),
    NavItem(
      title: 'Calendar',
      icon: PhosphorIcons.calendar,
      filledIcon: PhosphorIcons.calendar_fill,
    ),
  ];

  void updateIndex(int index) {
    if (index >= 0 && index < navItems.length) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}
