import 'package:flutter/material.dart';

import '../utils/global.dart';

class SnackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200.0),  // Add desired top spacing
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.block_sharp,  // Icon in the middle
              size: 70,  // Icon size
              color: AppColors.imagecolor,  // Icon color
            ),
            const SizedBox(height: 10),  // Spacing between the icon and text
            const Text(
              'No Platters Available',  // Text under the icon
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontFamily: 'Lexend',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
