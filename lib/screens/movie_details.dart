import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../components/darktheme/dark_theme_provider.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final movie = args['movie'];
    final genresString = args['genresString'];

    final themeChange = Provider.of<DarkThemeProvider>(context);
    DateTime? date;
    if (movie["release_date"] != "" && movie["release_date"] != null) {
      date = DateTime.parse(movie["release_date"]);
    } else if (movie["first_air_date"] != "" &&
        movie["first_air_date"] != null) {
      date = DateTime.parse(movie['first_air_date']);
    } else {
      date = null;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Movie Details'), actions: [
        Switch(
            value: themeChange.darkTheme,
            onChanged: (bool value) {
              themeChange.darkTheme = value;
            })
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: movie['backdrop_path'] == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('noImage.png',
                                    fit: BoxFit.cover),
                              )
                            ])
                      : FadeInImage(
                          height: 450,
                          width: 300,
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/' +
                                movie['poster_path'],
                          ),
                          fit: BoxFit.cover,
                          placeholder: const AssetImage('loading.gif'),
                        )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Text(movie['title'] ?? movie['name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      letterSpacing: 1.2)),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Text(genresString != '' ? genresString : 'No genres',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1.2))),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movie['vote_average'] != null
                        ? 'Score : ' + movie['vote_average'].toString() + ' /10'
                        : 'No score found',
                    style: const TextStyle(fontSize: 18, letterSpacing: 1.2),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.star),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    date != null
                        ? 'Release date : ' + DateFormat.yMMMMd().format(date)
                        : "Release date : No release date",
                    style: const TextStyle(fontSize: 17, letterSpacing: 1.2))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(movie['overview'] ?? "No description available",
                  style: TextStyle(
                      letterSpacing: 1.2, wordSpacing: 1, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
