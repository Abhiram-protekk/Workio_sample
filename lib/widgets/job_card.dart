// import 'package:flutter/material.dart';
//
// class JobPostingCard extends StatelessWidget {
//   final String title;
//   final String postedBy;
//   final String location;
//   final String date;
//   final int peopleNeeded;
//   final double salary;
//   final List<String> tags;
//   final String? audioUrl;
//   final VoidCallback onApply;
//   final VoidCallback onProfileView;
//   final String? profileImageUrl;
//
//   const JobPostingCard({
//     Key? key,
//     required this.title,
//     required this.postedBy,
//     required this.location,
//     required this.date,
//     required this.peopleNeeded,
//     required this.salary,
//     required this.tags,
//     this.audioUrl,
//     required this.onApply,
//     required this.onProfileView,
//     this.profileImageUrl,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         postedBy,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 if (profileImageUrl != null)
//                   CircleAvatar(
//                     radius: 20,
//                     backgroundImage: NetworkImage(profileImageUrl!),
//                   ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 const Icon(Icons.location_on_outlined, size: 16),
//                 const SizedBox(width: 4),
//                 Text(location),
//                 const Spacer(),
//                 const Icon(Icons.calendar_today, size: 16),
//                 const SizedBox(width: 4),
//                 Text(date),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 const Icon(Icons.people_outline, size: 16),
//                 const SizedBox(width: 4),
//                 Text('People Needed- $peopleNeeded'),
//                 const Spacer(),
//                 const Icon(Icons.currency_rupee, size: 16),
//                 const SizedBox(width: 4),
//                 Text('Rs-$salary'),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: tags.map((tag) => Chip(
//                 label: Text(
//                   '#$tag',
//                   style: const TextStyle(fontSize: 12),
//                 ),
//                 backgroundColor: Colors.grey[200],
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//               )).toList(),
//             ),
//             if (audioUrl != null) ...[
//               const SizedBox(height: 12),
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   children: [
//                     const SizedBox(width: 12),
//                     const Icon(Icons.play_arrow, size: 24),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: CustomAudioWaveform(),
//                     ),
//                     const SizedBox(width: 8),
//                     const Text('00:12'),
//                     const SizedBox(width: 12),
//                   ],
//                 ),
//               ),
//             ],
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: onApply,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF5E4B8B),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text('Apply Now'),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: onProfileView,
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       side: const BorderSide(color: Color(0xFF5E4B8B)),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'Profile',
//                       style: TextStyle(color: Color(0xFF5E4B8B)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CustomAudioWaveform extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(
//         20,
//             (index) => Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 1),
//             child: Container(
//               height: 20 * (0.3 + 0.7 * (index % 3) / 2),
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class JobPostingCard extends StatelessWidget {
  final String title;
  final String postedBy;
  final String location;
  final String date;
  final int peopleNeeded;
  final double salary;
  final String tag;
  final List<String> tags;
  final String? audioUrl;
  final VoidCallback onApply;
  final VoidCallback onProfileView;
  final String? profileImageUrl;

  const JobPostingCard({
    Key? key,
    required this.title,
    required this.postedBy,
    required this.location,
    required this.date,
    required this.peopleNeeded,
    required this.salary,
    required this.tags,
    this.audioUrl,
    required this.onApply,
    required this.onProfileView,
    this.profileImageUrl, required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        postedBy,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                if (profileImageUrl != null)
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(profileImageUrl!),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                PhosphorIcon(PhosphorIconsBold.mapPinArea,size: 16),
                const SizedBox(width: 4),
                Text(location,style:TextStyle(fontWeight: FontWeight.bold,)),
                const Spacer(),
                PhosphorIcon(PhosphorIconsBold.calendarDots,size: 16),
                const SizedBox(width: 4),
                Text(date,style:TextStyle(fontWeight: FontWeight.bold,)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                PhosphorIcon(PhosphorIconsBold.userCirclePlus,size: 16),
                const SizedBox(width: 4),
                Text('People Needed- $peopleNeeded',style:TextStyle(fontWeight: FontWeight.bold, ),),
                const Spacer(),
                PhosphorIcon(PhosphorIconsBold.moneyWavy,size: 16),
                const SizedBox(width: 4),
                Text('Rs-$salary',style:TextStyle(fontWeight: FontWeight.bold,)),
              ],
            ),
            const SizedBox(height: 12),

            Text(
              tag,
              style: const TextStyle(
                fontSize: 15,
                  fontWeight: FontWeight.bold,
                color: Colors.black
                // fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) => Text(
                '#$tag',
                style: const TextStyle(fontSize: 12, color: Colors.black),
              )).toList(),
            )
            ,
            const SizedBox(height: 12),

            if (audioUrl != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.26),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Play button
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFD7C7FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: Icon(
                          Icons.play_arrow_outlined,
                          size: 24, //
                        ),
                        onPressed: () {
                         },
                      ),
                    ),

                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomAudioWaveform(),
                    ),
                    const SizedBox(width: 8),
                    const Text('00:12'),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onApply,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5E4B8B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Ensures the row takes minimal space
                      mainAxisAlignment: MainAxisAlignment.center, // Centers content
                      children: [
                        PhosphorIcon(PhosphorIconsBold.checkSquareOffset, size: 20, color: Colors.white)
                        ,const SizedBox(width: 8), // Add spacing between icon and text
                        const Text('Apply Now'),
                      ],
                    ),
                  ),
                )
                ,
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onProfileView,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: Color(0xFF5E4B8B)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Ensures the row takes minimal space
                      mainAxisAlignment: MainAxisAlignment.center, // Centers content
                      children: [
                        PhosphorIcon(PhosphorIconsBold.userCircleDashed,size: 20, color: Color(0xFF5E4B8B)),
                         const SizedBox(width: 8), // Add spacing between icon and text
                        const Text(
                          'Profile',
                          style: TextStyle(color: Color(0xFF5E4B8B)),
                        ),
                      ],
                    ),
                  ),
                )
                ,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAudioWaveform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Heights for the waveform bars to create the pattern shown in the image
    final List<double> heights = [
      24, 28, 32, 26, 22,  // First group
      28, 32, 26, 24, 20,  // Second group
      26, 30, 24, 22, 18,  // Third group
      24, 28, 22, 20, 16   // Fourth group
    ];

    return Container(
      width: double.infinity,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          heights.length,
              (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.9),
            child: Container(
              width: 3,
              height: heights[index],
              decoration: BoxDecoration(
                color: const Color(0xFFD7C7FF),
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}