import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final tmdbWithLogs = TMDB(
      ApiKeys('0afa2097e0c2ef64f9ce5f27c0e16c99', 'apiReadAccessTokenv4'),
      logConfig: const ConfigLogger.showAll(),
    );

    return FutureBuilder(
        future: tmdbWithLogs.v3.movies.getPopular(),
        builder: (context, AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return Scaffold(
              appBar: AppBar(title: const Text("Flutter Movies App")),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
