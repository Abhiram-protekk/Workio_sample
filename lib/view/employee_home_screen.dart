

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_bottom_bar.dart';
import '../widgets/custom_filter.dart';
import '../widgets/custom_searchbar.dart';
import '../widgets/job_card.dart';
import '../controller/navigation_provider.dart';

class EmployeeHomeScreen extends StatelessWidget {
  const EmployeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffECEFFF),
            title: const Text(
              "Welcome",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
            ),
            actions: [
              Row(
                children: [
                  PhosphorIcon(
                    PhosphorIcons.userSwitch(),
                    size: 30,
                  ),
                  const SizedBox(width: 20),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(



                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcXmPNYZ-XDmbuO5gzHPM-sq33yAn0EFQepA&s"),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
          body: Consumer<NavigationProvider>(builder: (context, controller, _) {
            switch (controller.selectedIndex) {
              case 0:
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomSearchBar(
                                controller: searchController,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const CustomFilterButton(),
                          ],
                        ),
                        const SizedBox(height: 16),
                        JobPostingCard(
                          title: 'Car Driving',
                          postedBy: 'hari',
                          location: 'Chennai-Madurai',
                          date: '20-12-2024',
                          peopleNeeded: 10,
                          salary: 5000,
                          tag: "Tags",
                          tags: ['drive', 'driver', 'car'],
                          audioUrl: 'dummy_url',
                          profileImageUrl: 'https://images.unsplash.com/photo-1463453091185-61582044d556?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZSUyMHBpY3xlbnwwfHwwfHx8MA%3D%3D',
                          onApply: () {},
                          onProfileView: () {},
                        ),
                        const SizedBox(height: 16),
                        JobPostingCard(
                          title: 'Car Driving',
                          postedBy: 'hari',
                          location: 'Chennai-Madurai',
                          date: '20-12-2024',
                          peopleNeeded: 10,
                          salary: 5000,
                          tag: "Tags",
                          tags: ['drive', 'driver', 'car'],
                          audioUrl: 'dummy_url',
                          profileImageUrl: 'https://media.istockphoto.com/id/1303206558/photo/headshot-portrait-of-smiling-businessman-talk-on-video-call.webp?a=1&b=1&s=612x612&w=0&k=20&c=8lmFJ68jo0AB02jBDHswcJjuh_YhQMKEC7nTrtgQ58I=',
                          onApply: () {},
                          onProfileView: () {},
                        ),
                      ],
                    ),
                  ),
                );
              case 1:
                return const Center(child: Text("Notifications Screen"));
              case 2:
                return const Center(child: Text("Add Screen"));
              case 3:
                return const Center(child: Text("Location Screen"));
              default:
                return const Center(child: Text("Calendar Screen"));
            }
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () => Provider.of<NavigationProvider>(context, listen: false).updateIndex(2),
            backgroundColor: const Color(0xFF5E4B8B),
            elevation: 5,
            shape: const CircleBorder(),
            child:PhosphorIcon(PhosphorIconsBold.mapPinArea, color: Colors.white, size: 32)
,
          ),
          // Wrap the BottomAppBar inside ClipRRect to create oval shape
          bottomNavigationBar: const CustomNavBar(),
        );
      }),
    );
  }
}
