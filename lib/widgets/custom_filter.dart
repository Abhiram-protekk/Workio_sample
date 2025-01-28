// import 'package:flutter/material.dart';
// import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class CustomFilterButton extends StatelessWidget {
//   const CustomFilterButton({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 48,
//       height: 48,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.zero,
//           topRight: Radius.circular(12),
//           bottomLeft: Radius.zero,
//           bottomRight: Radius.zero,
//         ),
//         border: Border.all(
//           color: Colors.black.withOpacity(0.1),
//           width: 1,
//         ),
//       ),
//       child: IconButton(
//         onPressed: () {},
//         icon: Icon(
//           PhosphorIcons.funnel,
//           size: 24,
//           color: Colors.black87,
//         ),
//         // child: IconButton(
//         //
//         //     PhosphorIcons.funnel,
//         //     size: 24, //
//         //     color: Colors.black87,
//         //   ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class CustomFilterButton extends StatelessWidget {
  const CustomFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.circular(12),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: () {
          showFilterDialog(context);
        },
        icon: Icon(
          PhosphorIcons.funnel,
          size: 24,
          color: Colors.black87,
        ),
      ),
    );
  }

  void showFilterDialog(BuildContext context) {
    double currentRangeValue = 15.0;
    List<String> workTypes = ['Driving', 'Plumber', 'Framing', 'Barber'];
    String selectedWork = 'Driving';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Ratings Section
                    const Text(
                      'Ratings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ...List.generate(5, (index) => Icon(
                          Icons.star,
                          color: index < 4 ? Colors.amber : Colors.grey[300],
                          size: 24,
                        )),
                        const SizedBox(width: 8),
                        Text(
                          '(4.0/5)',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Range Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Range',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${currentRangeValue.round()} km',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF5E4B8B),
                        inactiveTrackColor: Colors.grey[300],
                        thumbColor: const Color(0xFF5E4B8B),
                        overlayColor: const Color(0xFF5E4B8B).withOpacity(0.2),
                      ),
                      child: Slider(
                        value: currentRangeValue,
                        min: 0,
                        max: 50,
                        onChanged: (value) {
                          setState(() {
                            currentRangeValue = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Select works Section
                    const Text(
                      'Select works',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: workTypes.map((work) {
                        final isSelected = work == selectedWork;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedWork = work;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF5E4B8B)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF5E4B8B)
                                    : Colors.grey[300]!,
                              ),
                            ),
                            child: Text(
                              work,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),
                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
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
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle filter application here
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: const Color(0xFF5E4B8B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Apply',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}