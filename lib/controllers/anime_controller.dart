import 'package:flutter/material.dart';
import 'package:latres/models/anime_model.dart';
import 'package:latres/services/anime_service.dart';

class AnimeController {
  final AnimeService animeService = AnimeService();

  List<AnimeModel> animeList = [];

  Future<void> fetchAnimeData() async {
    try {
      animeList = await animeService.fetchAnimeData();
    } catch (e) {
      debugPrint("Error fetch anime: $e");
    }
  }
}
