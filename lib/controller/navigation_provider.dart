import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../models/nav_items.dart';


class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  final List<NavItem> navItems = [
    NavItem(
      title: 'Home',
      icon: PhosphorIcons.house(),
      filledIcon: PhosphorIcons.house(),
    ),
    NavItem(
      title: 'Notifications',
      icon: PhosphorIcons.chatText(),
      filledIcon: PhosphorIcons.chatText(),
    ),
    NavItem(
      title: 'Add',
      icon: PhosphorIcons.mapPinArea(),
      filledIcon: PhosphorIcons.mapPinArea(),
    ),
    NavItem(
      title: 'Location',
      icon: PhosphorIcons.heart(),
      filledIcon: PhosphorIcons.house(),
    ),
    NavItem(
      title: 'Calendar',
      icon: PhosphorIcons.calendarDots(),
      filledIcon:PhosphorIcons.calendarDots(),
    ),
  ];

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
