// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => NavigationProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
//
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Custom Nav Bar'),
//         backgroundColor: const Color(0xFF5E4B8B),
//       ),
//       body: Center(
//         child: Text(
//           'Main Content',
//           style: TextStyle(fontSize: 18.sp),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () =>
//             Provider.of<NavigationProvider>(context, listen: false)
//                 .updateIndex(2),
//         backgroundColor: const Color(0xFF5E4B8B),
//         elevation: 5,
//         shape: const CircleBorder(),
//         child: const Icon(Icons.add, color: Colors.white, size: 32),
//       ),
//       bottomNavigationBar: const CustomNavBar(),
//     );
//   }
// }
//
// class CustomNavBar extends StatelessWidget {
//   final Color? bgcolor;
//
//   const CustomNavBar({super.key, this.bgcolor = const Color(0xFF5E4B8B)});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: bgcolor,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(5.h),
//           topRight: Radius.circular(5.h),
//           bottomLeft: Radius.circular(5.h), // Bottom corners rounded
//           bottomRight: Radius.circular(5.h),
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 4.w),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(
//             5, // Total navigation items
//                 (index) => _buildNavItem(context, index),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNavItem(BuildContext context, int index) {
//     final controller = Provider.of<NavigationProvider>(context);
//     final item = controller.navItems[index];
//     final isSelected = controller.selectedIndex == index;
//
//     if (index == 2) return const SizedBox(width: 50); // Space for FAB
//
//     return IconButton(
//       onPressed: () => controller.updateIndex(index),
//       icon: Icon(
//         isSelected ? item.filledIcon : item.icon,
//         color: isSelected ? Colors.white : Colors.white70,
//         size: isSelected ? 26.px : 24.px,
//       ),
//     );
//   }
// }
//
// class NavigationProvider with ChangeNotifier {
//   int _selectedIndex = 0;
//
//   int get selectedIndex => _selectedIndex;
//
//   final List<NavItem> navItems = [
//     NavItem(
//       title: 'Home',
//       icon: Icons.home_outlined,
//       filledIcon: Icons.home,
//     ),
//     NavItem(
//       title: 'Search',
//       icon: Icons.search_outlined,
//       filledIcon: Icons.search,
//     ),
//     NavItem(
//       title: 'Add',
//       icon: Icons.add_outlined,
//       filledIcon: Icons.add_circle,
//     ),
//     NavItem(
//       title: 'Profile',
//       icon: Icons.person_outline,
//       filledIcon: Icons.person,
//     ),
//     NavItem(
//       title: 'Settings',
//       icon: Icons.settings_outlined,
//       filledIcon: Icons.settings,
//     ),
//   ];
//
//   void updateIndex(int index) {
//     _selectedIndex = index;
//     notifyListeners(); // Notify listeners to rebuild UI
//   }
// }
//
// class NavItem {
//   final String title;
//   final IconData icon;
//   final IconData filledIcon;
//
//   NavItem({required this.title, required this.icon, required this.filledIcon});
// }
