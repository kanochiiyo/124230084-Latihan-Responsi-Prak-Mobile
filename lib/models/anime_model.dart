class AnimeModel {
  final String malId;
  final String title;
  final String titleEnglish;
  final String titleJapanese;
  final String score;
  final String synopsis;
  final String status;
  final String imageUrl;

  AnimeModel({
    required this.malId,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.score,
    required this.synopsis,
    required this.status,
    required this.imageUrl,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      malId: json['mal_id'].toString(),
      title: json['title'] ?? '',
      titleEnglish: json['title_english'] ?? '',
      titleJapanese: json['title_japanese'] ?? '',
      score: json['score'].toString(),
      synopsis: json['synopsis'] ?? '',
      status: json['status'] ?? '',
      imageUrl: json['images']['jpg']['image_url'] ?? '',
    );
  }
}
