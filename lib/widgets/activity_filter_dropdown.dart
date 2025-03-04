import 'package:flutter/material.dart';

class ActivityFilterDropdown extends StatefulWidget {
  final Function(String) onFilterSelected;

  ActivityFilterDropdown({required this.onFilterSelected});

  @override
  _ActivityFilterDropdownState createState() => _ActivityFilterDropdownState();
}

class _ActivityFilterDropdownState extends State<ActivityFilterDropdown> {
  String selectedFilter = "All";
  final Map<String, Color> filterColors = {
    "All": Colors.black,
    "Gross Motor": Color(0xFF4A90E2),
    "Fine Motor": Color(0xFF7ED321),
    "Communication": Color(0xFFF5A623),
    "Sensory": Color(0xFFD0021B),
  };

  void _showFilterMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset buttonPosition = button.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy + button.size.height,
        buttonPosition.dx + button.size.width,
        buttonPosition.dy + button.size.height * 2,
      ),
      color: Color(0xFFFEFEFE), // ✅ Background color
      shadowColor: Colors.black.withOpacity(0.01), // ✅ Drop shadow color at 1% opacity
      elevation: 4, // ✅ Ensures the shadow effect
      items: filterColors.keys.map((String category) {
        return PopupMenuItem<String>(
          value: category,
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: filterColors[category],
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Text(category),
            ],
          ),
        );
      }).toList(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedFilter = value;
        });
        widget.onFilterSelected(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFilterMenu(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              selectedFilter,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: filterColors[selectedFilter],
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.arrow_drop_down, size: 20, color: Colors.black),
          ],
        ),
      ),
    );
  }
}