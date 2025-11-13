import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latres/models/anime_model.dart';

class AnimeService {
  final String baseUrl = "https://api.jikan.moe/";

  Future<List<AnimeModel>> fetchAnimeData() async {
    final String fullUrl = "$baseUrl/v4/top/anime";
    final response = await http.get(Uri.parse(fullUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List anime = data['data'];
      return anime.map((e) => AnimeModel.fromJson(e)).toList();
    } else {
      throw Exception("Gagal fetch API.");
    }
  }
}
