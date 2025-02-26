import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  // 🔥 List to store favorited pediatricians
  final List<String> _favorites = [];

  // 🔥 Getter to access the favorites
  List<String> get favorites => List.unmodifiable(_favorites);

  // 🔥 Add to Favorites (Ensures no duplicates)
  void addFavorite(String name) {
    if (!_favorites.contains(name)) {
      _favorites.add(name);
      notifyListeners();
    }
  }

  // 🔥 Remove from Favorites (If exists in list)
  void removeFavorite(String name) {
    if (_favorites.contains(name)) {
      _favorites.remove(name);
      notifyListeners();
    }
  }

  // 🔥 Toggle Favorite Status (Uses add and remove methods)
  void toggleFavorite(String name) {
    if (isFavorite(name)) {
      removeFavorite(name);
    } else {
      addFavorite(name);
    }
  }

  // 🔥 Check if a pediatrician is favorited
  bool isFavorite(String name) {
    return _favorites.contains(name);
  }

  // 🔥 Clear All Favorites (Optional Utility)
  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}
