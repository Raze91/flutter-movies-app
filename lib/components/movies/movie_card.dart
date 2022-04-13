import 'package:flutter/cupertino.dart';

class MovieCard extends StatelessWidget {
  final movie;
  final genres;

  const MovieCard({Key? key, required this.movie, required this.genres})
      : super(key: key);

  String getGenres() {
    var finalGenre = [];

    for (var genreId in movie['genre_ids']) {
      final genre = genres.where((genre) => genre['id']  == genreId).toList();
      finalGenre.add(genre[0]['name']);
    }

    return finalGenre.join(" - ");
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://image.tmdb.org/t/p/w500' +
                        movie['poster_path']))),
          ),
          Text(
            movie['title'],
            style: TextStyle(fontSize: 12),
          ),
          Text(
            getGenres(),
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
