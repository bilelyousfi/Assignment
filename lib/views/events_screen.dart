


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/events_view_model.dart';
import '../widgets/event_card.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    final eventsViewModel = Provider.of<EventsViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate card width based on screen size
    final cardWidth = (screenWidth - 48) / 3; // 3 cards with padding (16px left, 16px right, 12px spacing)
    final cardHeight = cardWidth * (133.47 / 109); // Maintain aspect ratio

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Events',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: eventsViewModel.events.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Always 3 cards per row
            crossAxisSpacing: 12, // Space between columns
            mainAxisSpacing: 12, // Space between rows
            childAspectRatio: cardWidth / cardHeight, // Maintain aspect ratio dynamically
          ),
          itemBuilder: (context, index) {
            final event = eventsViewModel.events[index];
            return EventCard(
              imagePath: event['imagePath']!,
              title: event['title']!,
              cardWidth: cardWidth,
              cardHeight: cardHeight,
            );
          },
        ),
      ),
    );
  }
}