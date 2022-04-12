import 'package:flutter/material.dart';
import 'package:flutter_movies_app/components/movie_card.dart';

class MoviesList extends StatelessWidget {
  final List movies;
  final String title;

  const MoviesList({Key? key, required this.movies, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(title),
          const SizedBox(height: 10),
          SizedBox(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => {},
                    child: SizedBox(
                      width: 140,
                      child: MovieCard(movie: movies[index]),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
