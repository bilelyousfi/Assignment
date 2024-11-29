import 'package:flutter/material.dart';
import 'package:mobileapp/utils/global.dart';
import '../models/event_card.dart';

class EventCardWidget extends StatelessWidget {
  final EventCard event;

  const EventCardWidget({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4E6E7), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with Rounded Top Corners
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Stack(
              children: [
                Image.asset(
                  event.imagefood,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,

                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: AppColors.appGradient,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Popular',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Name and Divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.Namefood,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend',
                  ),
                ),
                const Divider(),
                // Person and Time
                Row(
                  children: [
                    Icon(Icons.person, size: 14, color: AppColors.forth),
                    const SizedBox(width: 5),
                    Text(
                      event.time,
                      style: const TextStyle(fontSize: 14, fontFamily: 'Lexend', color: AppColors.forth),
                    ),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lexend',
                          color: Colors.black, // Default color for the whole text
                        ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Starts at ', // Non-bold part
                            style: TextStyle(
                              fontFamily: 'Lexend',color: AppColors.textcolor,fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: event.startat, // The bold part
                            style: const TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // Bold styling for startat
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const Divider(),
                // Start At and Categories
                Row(
                  children: [


                    Text(
                      event.categories,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
          // Details Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailsColumn(event.live1,event.main1 , event.desserts1),
                _buildDetailsColumn(event.live2, event.main2,event.desserts2 ),
                _buildDetailsColumn(event.live3, event.main3, event.desserts3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsColumn(String item1, String item2, String item3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item1, style: const TextStyle(fontSize: 12, fontFamily: 'Lexend',color: AppColors.textcolor)),
        const SizedBox(height: 4),
        Text(item2, style: const TextStyle(fontSize: 12, fontFamily: 'Lexend',color:AppColors.textcolor)),
        const SizedBox(height: 4),
        Text(item3, style: const TextStyle(fontSize: 12, fontFamily: 'Lexend',color:AppColors.textcolor)),
      ],
    );
  }
}
