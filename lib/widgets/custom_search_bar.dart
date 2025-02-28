import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final FocusNode searchFocusNode;
  final String hintText;
  final ValueChanged<String> onChanged; // 🔥 Callback for search input

  const CustomSearchBar({
    super.key,
    required this.searchFocusNode,
    required this.onChanged,
    this.hintText = 'Search Pediatricians',
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.searchFocusNode,
      onChanged: widget.onChanged, // 🔥 Send input to parent widget
      style: TextStyle(
        color:
            widget.searchFocusNode.hasFocus
                ? Colors
                    .black // 🔥 Black when focused
                : Color(0xFFC9C9C9), // 🔥 #C9C9C9 when not focused
      ),
      cursorColor: Color(0xFF212529), // Matching Neutral Dark Color
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color:
              widget.searchFocusNode.hasFocus
                  ? Colors
                      .black // 🔥 Black when focused
                  : Color(0xFFC9C9C9), // 🔥 #C9C9C9 when not focused
        ),
        suffixIcon: Icon(
          Icons.search,
          color:
              widget.searchFocusNode.hasFocus
                  ? Colors
                      .black // 🔥 Black when focused
                  : Color(0xFFC9C9C9), // 🔥 #C9C9C9 when not focused
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color(0xFFC9C9C9), // 🔥 #C9C9C9 by default
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color(0xFFC9C9C9), // 🔥 #C9C9C9 when not focused
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.black, // 🔥 Black when focused
            width: 1,
          ),
        ),
        filled: true,
        fillColor: Color(0xFFF5F5F5), // Background Color (unchanged)
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }
}
