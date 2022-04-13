import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {
  final movie;
  final String genresString;

  const MovieCard({Key? key, required this.movie, required this.genresString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date;
    if (movie["release_date"] != "") {
      date = DateTime.parse(movie["release_date"]);
    } else {
      date = DateTime.parse(movie['first_air_date']);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: movie['backdrop_path'] == null
                    ? Image.asset('noImage.png', fit: BoxFit.cover)
                    : Image.network(
                        'https://image.tmdb.org/t/p/w500' +
                            movie['backdrop_path'],
                        fit: BoxFit.cover,
                      ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              movie['title'] ?? movie['name'],
              style: const TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Text(
              genresString,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Text(
            DateFormat.yMMMMd().format(date),
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
