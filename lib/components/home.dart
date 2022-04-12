import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/components/movies_list.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List popularMovies = [];

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithLogs = TMDB(
      ApiKeys('0afa2097e0c2ef64f9ce5f27c0e16c99', 'apiReadAccessTokenv4'),
      logConfig: const ConfigLogger.showAll(),
    );

    Map popularResults = await tmdbWithLogs.v3.movies.getPopular();
    setState(() {
      popularMovies = popularResults['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [MoviesList(title: 'Popular Movies', movies: popularMovies)],
    );
  }
}
