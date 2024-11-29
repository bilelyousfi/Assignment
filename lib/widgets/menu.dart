import 'package:flutter/material.dart';
import '../utils/menu_item_widget.dart';
import '../utils/global.dart';
import '../viewmodels/event_card_view_model.dart';

class MenuWidget extends StatefulWidget {
  final int selectedButton;
  final Function(int) onButtonSelect;
  final int selectedMenuIndex;
  final Function(int) onMenuSelect;

  const MenuWidget({
    Key? key,
    required this.selectedButton,
    required this.onButtonSelect,
    required this.selectedMenuIndex,
    required this.onMenuSelect,
  }) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Ensure menu background remains transparent
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          // Row for buttons with space between them
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                // Bulk Food Delivery Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      widget.onButtonSelect(0); // Callback to update selected button
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return SlideTransition(position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero).animate(animation), child: child);
                      },
                      child: AnimatedContainer(
                        key: ValueKey<int>(widget.selectedButton),
                        duration: const Duration(milliseconds: 300),
                        height: 50,
                        decoration: BoxDecoration(
                          color: widget.selectedButton == 0
                              ? Colors.white
                              : Colors.white.withOpacity(0.8),
                          borderRadius: widget.selectedButton == 0
                              ? const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          )
                              : const BorderRadius.all(Radius.circular(12)),
                          border: widget.selectedButton == 0
                              ? null
                              : Border.all(color: Colors.grey),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Bulk Food Delivery',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lexend',
                            color: widget.selectedButton == 0
                                ? AppColors.primary
                                : AppColors.third,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Catering Service Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      widget.onButtonSelect(1); // Callback to update selected button
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return SlideTransition(position: Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero).animate(animation), child: child);
                      },
                      child: AnimatedContainer(
                        key: ValueKey<int>(widget.selectedButton),
                        duration: const Duration(milliseconds: 300),
                        height: 50,
                        decoration: BoxDecoration(
                          color: widget.selectedButton == 1
                              ? Colors.white
                              : Colors.white.withOpacity(0.8),
                          borderRadius: widget.selectedButton == 1
                              ? const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          )
                              : const BorderRadius.all(Radius.circular(12)),
                          border: widget.selectedButton == 1
                              ? null
                              : Border.all(color: Colors.grey),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Catering Service',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lexend',
                            color: widget.selectedButton == 1
                                ? AppColors.primary
                                : AppColors.third,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          widget.selectedButton == -1 ? const SizedBox(height: 12) : Container(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              color: widget.selectedButton == -1 ? Colors.transparent : Colors.white,
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuItemWidget(
                      title: 'All (${EventCardViewModel.eventCards.length})', // Show count next to 'All'
                      index: 0,
                      selectedMenuIndex: widget.selectedMenuIndex,
                      onMenuSelect: widget.onMenuSelect,
                    ),
                    MenuItemWidget(
                      title: 'Breakfast',
                      index: 1,
                      selectedMenuIndex: widget.selectedMenuIndex,
                      onMenuSelect: widget.onMenuSelect,
                    ),
                    MenuItemWidget(
                      title: 'Lunch & Dinner',
                      index: 2,
                      selectedMenuIndex: widget.selectedMenuIndex,
                      onMenuSelect: widget.onMenuSelect,
                    ),
                    MenuItemWidget(
                      title: 'Snacks',
                      index: 3,
                      selectedMenuIndex: widget.selectedMenuIndex,
                      onMenuSelect: widget.onMenuSelect,
                    ),
                  ],
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  bottom: 0,
                  left: widget.selectedMenuIndex == 0
                      ? 0
                      : widget.selectedMenuIndex == 1
                      ? MediaQuery.of(context).size.width / 4 -5
                      : widget.selectedMenuIndex == 2
                      ? MediaQuery.of(context).size.width / 2  +15// Center the indicator under Lunch & Dinner
                      : MediaQuery.of(context).size.width * 3 / 4 +35, // Center the indicator under Snacks
                  child: Container(
                    width: 30, // Indicator width
                    height: 2,
                    color: AppColors.second, // Customize your indicator's color here
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
