import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'movies_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List popularMovies = [];
  List trendings = [];
  List topRatedMovies = [];

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
    Map trendingResults = await tmdbWithLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithLogs.v3.movies.getTopRated();

    setState(() {
      popularMovies = popularResults['results'];
      trendings = trendingResults['results'];
      topRatedMovies = topRatedResults['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: ((context, snapshot) {
      if (popularMovies.isEmpty ||
          trendings.isEmpty ||
          topRatedMovies.isEmpty) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.3,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return ListView(
          children: [
            MoviesList(movies: popularMovies, title: 'Popular Movies'),
            MoviesList(movies: trendings, title: 'Trending Movies'),
            MoviesList(movies: topRatedMovies, title: 'Top Rated Movies')
          ],
        );
      }
    }));
  }
}