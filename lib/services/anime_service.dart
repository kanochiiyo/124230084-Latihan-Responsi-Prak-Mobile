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

  // Perlu fetch ulang karena bisa aja kalo kita ambil data yang udah difetch top anime, ada data favorite yang tersimpan tapi gak masuk top 25
  Future<AnimeModel> getAnimeById(String id) async {
    final String fullUrl = "$baseUrl/anime/$id";
    final response = await http.get(Uri.parse(fullUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final Map<String, dynamic> data = json['data'];
      return AnimeModel.fromJson(data);
    } else {
      throw Exception("Gagal mengambil data anime dengan id $id");
    }
  }
}
