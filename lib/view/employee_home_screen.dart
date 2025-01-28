// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
// import 'package:provider/provider.dart';
//
// import '../widgets/custom_bottom_bar.dart';
// import '../widgets/custom_filter.dart';
// import '../widgets/custom_searchbar.dart';
// import '../widgets/job_card.dart';
// import '../controller/navigation_provider.dart';
//
// class EmployeeHomeScreen extends StatelessWidget {
//   const EmployeeHomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController searchController = TextEditingController();
//
//     return ChangeNotifierProvider(
//       create: (_) => NavigationProvider(),
//       child: Builder(builder: (context) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: const Color(0xffECEFFF),
//             title: const Text(
//               "Welcome",
//               style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
//             ),
//             actions: [
//               Row(
//                 children: [
//                   Icon(
//                     PhosphorIcons.user_switch,
//                     size: 30,
//                   ),
//                   const SizedBox(width: 20),
//                   const CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcXmPNYZ-XDmbuO5gzHPM-sq33yAn0EFQepA&s"),
//                   ),
//                   const SizedBox(width: 10),
//                 ],
//               ),
//             ],
//           ),
//           body: Consumer<NavigationProvider>(builder: (context, controller, _) {
//             switch (controller.selectedIndex) {
//               case 0:
//                 return Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: CustomSearchBar(
//                                 controller: searchController,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             const CustomFilterButton(),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         JobPostingCard(
//                           title: 'Car Driving',
//                           postedBy: 'hari',
//                           location: 'Chennai-Madurai',
//                           date: '20-12-2024',
//                           peopleNeeded: 10,
//                           salary: 5000,
//                           tag: "Tags",
//                           tags: ['drive', 'driver', 'car'],
//                           audioUrl: 'dummy_url',
//                           profileImageUrl:
//                           'https://images.unsplash.com/photo-1463453091185-61582044d556?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZSUyMHBpY3xlbnwwfHwwfHx8MA%3D%3D',
//                           onApply: () => _showBottomSheet(context),
//                           onProfileView: () {},
//                         ),
//                         const SizedBox(height: 16),
//                         JobPostingCard(
//                           title: 'Car Driving',
//                           postedBy: 'hari',
//                           location: 'Chennai-Madurai',
//                           date: '20-12-2024',
//                           peopleNeeded: 10,
//                           salary: 5000,
//                           tag: "Tags",
//                           tags: ['drive', 'driver', 'car'],
//                           audioUrl: 'dummy_url',
//                           profileImageUrl:
//                           'https://media.istockphoto.com/id/1303206558/photo/headshot-portrait-of-smiling-businessman-talk-on-video-call.webp?a=1&b=1&s=612x612&w=0&k=20&c=8lmFJ68jo0AB02jBDHswcJjuh_YhQMKEC7nTrtgQ58I=',
//                           onApply: () => _showBottomSheet(context),
//                           onProfileView: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               case 1:
//                 return const Center(child: Text("Notifications Screen"));
//               case 2:
//                 return const Center(child: Text("Add Screen"));
//               case 3:
//                 return const Center(child: Text("Location Screen"));
//               default:
//                 return const Center(child: Text("Calendar Screen"));
//             }
//           }),
//           floatingActionButtonLocation:
//           FloatingActionButtonLocation.centerDocked,
//           floatingActionButton: FloatingActionButton(
//             onPressed: () =>
//                 Provider.of<NavigationProvider>(context, listen: false)
//                     .updateIndex(2),
//             backgroundColor: const Color(0xFF5E4B8B),
//             elevation: 5,
//             shape: const CircleBorder(),
//             child: Icon(PhosphorIcons.map_pin, color: Colors.white, size: 32),
//           ),
//           bottomNavigationBar: const CustomNavBar(),
//         );
//       }),
//     );
//   }
//
//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true, // Ensure the bottom sheet resizes when the keyboard appears
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(16), // Top-left corner rounded
//           topRight: Radius.circular(0), // Top-right corner not rounded
//           bottomLeft: Radius.circular(0), // Bottom-left corner not rounded
//           bottomRight: Radius.circular(0), // Bottom-right corner not rounded
//         ),
//       ),
//       builder: (context) {
//         final TextEditingController numberController = TextEditingController();
//         return Container(
//           width: 361, // Fixed width of 361px
//           padding: const EdgeInsets.only(top: 10), // Padding: 10px at the top
//           margin: const EdgeInsets.only(left: 16, right: 16), // Left: 16px, Right: 16px
//           child: Padding(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom + 20, // Add keyboard height + 20px gap
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min, // Height hugs content
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Enter Number of People",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10), // Gap: 10px
//                 TextField(
//                   controller: numberController,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: <TextInputFormatter>[
//                     FilteringTextInputFormatter.digitsOnly,
//                   ],
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.people),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20), // Gap: 20px (adjust as needed)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () {
//                           Navigator.pop(context); // Close the bottom sheet
//                         },
//                         child: const Text("Cancel"),
//                       ),
//                     ),
//                     const SizedBox(width: 10), // Gap: 10px
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Handle the apply logic
//                           Navigator.pop(context); // Close the bottom sheet
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF5E4B8B),
//                         ),
//                         child: const Text("Apply"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }}

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:workio_sample/view/calender.dart';
import 'package:workio_sample/view/message_screen.dart';
import 'package:workio_sample/view/location.dart';

import '../controller/navigation_provider.dart';
import '../widgets/custom_bottom_bar.dart';
import 'home_screen.dart';
import 'liked.dart';

class EmployeeHomeScreen extends StatelessWidget {
  const EmployeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        body: Consumer<NavigationProvider>(
          builder: (context, controller, _) {
            print('Current Selected Index in UI: ${controller.selectedIndex}');
            return IndexedStack(
              key: ValueKey(controller.selectedIndex),
              index: controller.selectedIndex,
              children: const [
                HomeScreen(),
                MessageScreen(),
                Location(),
                Liked(),
                Calender(),
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Provider.of<NavigationProvider>(context, listen: false)
                  .updateIndex(2),
          // Set index to 3 for Location
          backgroundColor: const Color(0xFF5E4B8B),
          elevation: 5,
          shape: const CircleBorder(),
          child: Icon(PhosphorIcons.map_pin, color: Colors.white, size: 32),
        ),
        bottomNavigationBar: const CustomNavBar(),
      ),
    );
  }
}
