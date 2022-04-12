import 'package:flutter/cupertino.dart';

class MovieCard extends StatelessWidget {
  final movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

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
          Text(movie['title'], style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
}
