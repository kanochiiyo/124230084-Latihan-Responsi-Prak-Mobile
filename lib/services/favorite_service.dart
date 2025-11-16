import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const _favoriteKey = 'favorite_anime_id';

  // Get favorite key
  Future<List<String>> getFavoriteIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoriteKey) ?? [];
  }

  // Cek semua anime apakah di favorite atau tidak
  Future<bool> isFavorite(String animeId) async {
    final ids = await getFavoriteIds();
    return ids.contains(animeId);
  }

  Future<void> toggleFavorite(String animeId) async {
    final prefs = await SharedPreferences.getInstance();
    // Untuk mendapatkan ID anime 
    List<String> ids = await getFavoriteIds();

    if (ids.contains(animeId)) {
      ids.remove(animeId);
    } else {
      ids.add(animeId);
    }

    await prefs.setStringList(_favoriteKey, ids);
  }
}
