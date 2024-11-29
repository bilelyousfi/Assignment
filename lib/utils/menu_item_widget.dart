import 'package:flutter/material.dart';
import '../utils/global.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;
  final int index;
  final int selectedMenuIndex;
  final Function(int) onMenuSelect;

  const MenuItemWidget({
    Key? key,
    required this.title,
    required this.index,
    required this.selectedMenuIndex,
    required this.onMenuSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onMenuSelect(index); // Callback to update selected menu item
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Lexend',
              color: selectedMenuIndex == index
                  ? AppColors.second
                  : AppColors.third,
            ),
          ),
        ],
      ),
    );
  }
}
