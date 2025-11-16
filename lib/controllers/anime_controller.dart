import 'package:flutter/material.dart';
import 'package:latres/models/anime_model.dart';
import 'package:latres/services/anime_service.dart';
import 'package:latres/services/favorite_service.dart';

class AnimeController {
  final AnimeService animeService = AnimeService();
  final FavoriteService favoriteService = FavoriteService();

  List<AnimeModel> animeList = [];

  Future<void> fetchAnimeData() async {
    try {
      animeList = await animeService.fetchAnimeData();
    } catch (e) {
      debugPrint("Error fetch anime: $e");
    }
  }

  Future<List<AnimeModel>> fetchFavoriteAnime() async {
    try {
      final List<String> ids = await favoriteService.getFavoriteIds();

      if (ids.isEmpty) {
        return [];
      }

      // Biar berjalan sama-sama dengan request API
      final futures = ids.map((id) => animeService.getAnimeById(id));
      return await Future.wait(futures);
    } catch (e) {
      throw Exception("Gagal memuat daftar anime favorite: $e");
    }
  }

 
}
