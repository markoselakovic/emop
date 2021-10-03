import 'dart:convert';

import 'package:emop/util/shared_preferences.dart';

class Favorites {
  final String _favoritesKey;
  List _favoriteItems;

  Favorites(this._favoritesKey) {
    _favoriteItems = [];
    fetchFavoritePreferences();
  }

  void addToFavorite(int id) {
    _favoriteItems.add(id);
    updateFavoritePreferences();
  }

  void removeFromFavorite(int id) {
    _favoriteItems.remove(id);
    updateFavoritePreferences();
  }

  bool isFavorite(int id) {
    return _favoriteItems.firstWhere((element) => element == id,
            orElse: () => null) !=
        null;
  }

  void updateFavoritePreferences() {
    String favoritesString = jsonEncode(_favoriteItems);
    EmopSharedPreferences()
        .setString(key: _favoritesKey, value: favoritesString);
  }

  void fetchFavoritePreferences() {
    String favoritesString =
        EmopSharedPreferences().getString(_favoritesKey);
    if (favoritesString != null && favoritesString.isNotEmpty) {
      List ids = [];
      final List<dynamic> itemsArray = json.decode(favoritesString);
      ids = itemsArray.map((dynamic item) {
        return item as int;
      }).toList();
      _favoriteItems = ids;
    }
  }
}
