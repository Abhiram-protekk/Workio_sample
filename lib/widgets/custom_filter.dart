import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomFilterButton extends StatelessWidget {

  const CustomFilterButton({
    super.key,
   });

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
        icon: PhosphorIcon(
          PhosphorIcons.funnel(),
          size: 24, //
          color: Colors.black87,
        ),
        onPressed: () {

        },
      ),

    );
  }
}


