import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../widgets/custom_filter.dart';
import '../widgets/custom_searchbar.dart';
import '../widgets/job_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

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
              Icon(
                PhosphorIcons.user_switch,
                size: 30,
              ),
              const SizedBox(width: 20),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcXmPNYZ-XDmbuO5gzHPM-sq33yAn0EFQepA&s",
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar and Filter
              Row(
                children: [
                  Expanded(
                    child: CustomSearchBar(
                      controller: searchController,
                    ),
                  ),
                  SizedBox(width: 10),
                  const CustomFilterButton(),

                ],
              ),
              const SizedBox(height: 16),
              // Job Cards
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
                profileImageUrl:
                    'https://images.unsplash.com/photo-1463453091185-61582044d556?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZSUyMHBpY3xlbnwwfHwwfHx8MA%3D%3D',
                onApply: () => _showPopupDialog(context),
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
                profileImageUrl:
                    'https://media.istockphoto.com/id/1303206558/photo/headshot-portrait-of-smiling-businessman-talk-on-video-call.webp?a=1&b=1&s=612x612&w=0&k=20&c=8lmFJ68jo0AB02jBDHswcJjuh_YhQMKEC7nTrtgQ58I=',
                onApply: () => _showPopupDialog(context),
                onProfileView: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPopupDialog(BuildContext context) {
    final TextEditingController numberController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: SizedBox(
            width: 370, // Fixed width
            height: 160, // Fixed height
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              // Padding as specified
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    " No. of People",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.people),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: const BorderSide(color: Color(0xFF5E4B8B)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Color(0xFF5E4B8B)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Space between the buttons
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Apply logic here
                            Navigator.pop(context); // Close the dialog
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(120, 40),
                            // Ensures buttons are the same size
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: const Color(0xFF5E4B8B),
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
