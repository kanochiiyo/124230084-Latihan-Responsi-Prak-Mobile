import 'package:flutter/material.dart';
import 'package:latres/controllers/anime_controller.dart';
import 'package:latres/views/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AnimeController animeController = AnimeController();

  @override
  void initState() {
    super.initState();
    fetchAnimeData();
  }

  Future<void> fetchAnimeData() async {
    await animeController.fetchAnimeData();
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Anime", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: [
          // Grid anime
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () {
                      final anime = animeController.animeList[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailView(anime: anime),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: _animeCard(context, index),
                  ),
                ),
                childCount: animeController.animeList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _animeCard(context, index) {
    final anime = animeController.animeList[index];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(81, 0, 0, 0),
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              anime.imageUrl,
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // TEKS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  anime.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 6),

                Text(
                  "Score: ${anime.score}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
