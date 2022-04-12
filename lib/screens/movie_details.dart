import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/darktheme/dark_theme_provider.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final movie = args['movie'];

    final themeChange = Provider.of<DarkThemeProvider>(context);

    print(movie);

    return Scaffold(
      appBar: AppBar(title: const Text('Movie Details'), actions: [
        Switch(
            value: themeChange.darkTheme,
            onChanged: (bool value) {
              themeChange.darkTheme = value;
            })
      ]),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 225,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://image.tmdb.org/t/p/w500' +
                            movie['backdrop_path']))),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(movie['title'],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Release date : ' + movie['release_date'])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(movie['overview']),
          ),
        ],
      ),
    );
  }
}
