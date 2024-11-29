
import 'package:flutter/material.dart';
import 'package:mobileapp/views/events_food_screen.dart';
import 'package:mobileapp/widgets/custom_page_route.dart';



class EventCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double cardWidth;
  final double cardHeight;

  const EventCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.cardWidth,
    required this.cardHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      Navigator.of(context).push(
        CustomPageRoute(child: EventsFoodScreen(eventTitle: title, eventImage: imagePath)),
      );
    },
    child: Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Semi-transparent overlay for better text visibility
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.8),
              color: Colors.black.withOpacity(0.4), // Dark overlay
            ),
          ),
          // Title positioned at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Lexend',
                  color: Colors.white,
                  fontSize: 13.35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

            ),
          ),
        ],
      ),
    ),
    );
  }
}

