import 'package:flutter/material.dart';
import 'package:flutter_movies_app/components/movies/movie_card.dart';

class MoviesList extends StatelessWidget {
  final List movies;
  final List genres;
  final String title;

  const MoviesList(
      {Key? key,
      required this.movies,
      required this.genres,
      required this.title})
      : super(key: key);

  String getGenres(movieIdx) {
    var finalGenre = [];

    for (var genreId in movies[movieIdx]['genre_ids']) {
      final genre = genres.where((genre) => genre['id'] == genreId).toList();
      finalGenre.add(genre[0]['name']);
    }

    return finalGenre.join(" - ");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          const SizedBox(height: 10),
          SizedBox(
            height: 260,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => {
                      Navigator.of(context).pushNamed('/details',
                          arguments: {'movie': movies[index], 'genresString': getGenres(index)})
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 140,
                          child:
                              MovieCard(movie: movies[index], genresString: getGenres(index)),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
