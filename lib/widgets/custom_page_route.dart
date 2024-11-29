import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;

  CustomPageRoute({required this.child})
      : super(
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // For forward transition, the next screen comes from the top-left
      const begin = Offset(-1.0, -1.0); // Start from top-left (off-screen)
      const end = Offset.zero; // End at the current position
      const curve = Curves.easeInOut;

      // Apply the transformation with tween and curve
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      // For the back transition (reversed), screen goes back to the top-left
      const reverseBegin = Offset.zero;
      const reverseEnd = Offset(-1.0, -1.0); // Ends at top-left (off-screen)

      var reverseTween = Tween(begin: reverseBegin, end: reverseEnd).chain(CurveTween(curve: curve));
      var reverseOffsetAnimation = secondaryAnimation.drive(reverseTween);

      // Use SlideTransition for both forward and reverse animations
      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween(begin: 0.95, end: 1.0).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            )),
            child: child,
          ),
        ),
      );
    },
  );
}
