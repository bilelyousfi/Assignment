import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/event_card_view_model.dart';
import '../widgets/menu.dart';
import '../widgets/event_card_widget.dart';
import '../widgets/snack_widget.dart';
import '../widgets/cart_bar_widget.dart';

class EventsFoodScreen extends StatefulWidget {
  final String eventTitle;
  final String eventImage;

  const EventsFoodScreen({
    Key? key,
    required this.eventTitle,
    required this.eventImage,
  }) : super(key: key);

  @override
  State<EventsFoodScreen> createState() => _EventsFoodScreenState();
}

class _EventsFoodScreenState extends State<EventsFoodScreen> {
  int selectedButton = 0; // 0 for Bulk Food Delivery, 1 for Catering Service
  int selectedMenuIndex = 0; // Track selected menu item

  // Callback function for button selection
  void onButtonSelect(int index) {
    setState(() {
      selectedButton = index;
    });
  }

  // Callback function for menu item selection
  void onMenuSelect(int index) {
    setState(() {
      selectedMenuIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Section with Image
          Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  widget.eventImage,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),

          // Event Title and Back Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 8,
            right: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  widget.eventTitle,
                  style: const TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 48), // Placeholder for symmetry
              ],
            ),
          ),

          // Position the menu widget under the title
          Positioned.fill(
            top: MediaQuery.of(context).padding.top + 145,
            child: Column(
              children: [
                MenuWidget(
                  selectedButton: selectedButton,
                  onButtonSelect: onButtonSelect,
                  selectedMenuIndex: selectedMenuIndex,
                  onMenuSelect: onMenuSelect,
                ),
                // Make this section scrollable
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Conditionally show SnackScreen content
                        if (selectedMenuIndex == 3)
                          SnackScreen(), // Show snack content if "Snacks" is selected

                        if (selectedMenuIndex != 3)
                          Consumer<EventCardViewModel>(
                            builder: (context, viewModel, _) {
                              if (selectedMenuIndex == 0) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: EventCardViewModel.eventCards.length,
                                  itemBuilder: (context, index) {
                                    return EventCardWidget(
                                      event: EventCardViewModel.eventCards[index],
                                    );
                                  },
                                );
                              } else {
                                return const SizedBox(); // Empty space for other selections
                              }
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Add the CartBarWidget at the bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0), // Add some padding for spacing
        child: const CartBarWidget(),
      ),
    );
  }
}
