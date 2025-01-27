import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/navigation_provider.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: BottomAppBar(
        color: const Color(0xFF5E4B8B),
        shape: const CircularNotchedRectangle(), // Notch for FAB
        notchMargin: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              5, // Total navigation items
                  (index) => _buildNavItem(context, index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index) {
    final controller = Provider.of<NavigationProvider>(context);
    final item = controller.navItems[index];
    final isSelected = controller.selectedIndex == index;

    if (index == 2) return const SizedBox(width: 50);
    return IconButton(
      onPressed: () => controller.updateIndex(index),
      icon: Icon(
        isSelected ? item.filledIcon : item.icon,
        color: isSelected ? Colors.white : Colors.white70,
        size: isSelected ? 26 : 24,
      ),
    );
  }
}
