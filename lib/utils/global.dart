import 'package:flutter/material.dart';

//app name
const appName = 'Movies App';

//media query to store size of device screen
late Size mq;



class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF6318AF);
  static const Color second = Color(0xFFE70472);
  static const Color third = Color(0xFF60666C);
  static const Color forth = Color(0xFF93999F);
  static const Color textcolor = Color(0xFF484C51);
  static const Color imagecolor = Color(0xFFB8BACC);

  static const LinearGradient appGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF9765CA), // #9765CA
      Color(0xFF7D3EBC), // #7D3EBC
      Color(0xFF7D3EBC), // #7D3EBC (same color as above)
      Color(0xFF6318AF), // #6318AF
    ],
    stops: [
      -0.0527, // -5.27% (position of the first color stop)
      0.296,   // 29.6% (position of the second color stop)
      0.5392,  // 53.92% (position of the third color stop)
      0.9843,  // 98.43% (position of the fourth color stop)
    ],
  );
}

