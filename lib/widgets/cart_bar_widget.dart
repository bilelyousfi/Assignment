import 'package:flutter/material.dart';
import 'package:mobileapp/utils/global.dart';

class CartBarWidget extends StatelessWidget {
  const CartBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60, // Explicit height
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Align items vertically
          children: [
            // Stack of overlapping images with white borders
            SizedBox(
              width: 60, // Adjust width for the number of images
              child: Stack(
                clipBehavior: Clip.none, // Allow overflow
                children: [
                  Positioned(
                    left: 0,
                    child: CircleAvatar(
                      radius: 16, // Increased radius for border
                      backgroundColor: AppColors.white, // White border
                      child: CircleAvatar(
                        radius: 14, // Inner radius
                        backgroundImage: AssetImage('assests/img_16.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20, // Overlap offset
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.white,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage('assests/img_16.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40, // Further offset
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.white,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage('assests/img_16.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15), // Adjust spacing between images and text
            // Centered text
            const Text(
              '3 Platters',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 15.33,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            // View Cart button
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: const [
                  Text(
                    'View Cart',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 12,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.keyboard_arrow_up,
                    size: 16,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
