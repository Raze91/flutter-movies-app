import 'package:flutter/cupertino.dart';

class MovieCard extends StatelessWidget {
  final movie;
  final genresString;

  const MovieCard({Key? key, required this.movie, required this.genresString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(genresString);
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
            genresString,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
