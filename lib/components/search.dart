import 'package:flutter/material.dart';
import 'package:flutter_movies_app/components/movies/movies_list.dart';
import 'package:tmdb_api/tmdb_api.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final key = GlobalKey<FormState>();
  String searchValue = '';
  List movies = [];
  List genres = [];

  loadMovies() async {
    TMDB tmdb = TMDB(
      ApiKeys('0afa2097e0c2ef64f9ce5f27c0e16c99', 'apiReadAccessTokenv4'),
    );

    Map searchResult = await tmdb.v3.search.queryMovies(searchValue);
    Map genresResult = await tmdb.v3.genres.getMovieList();

    setState(() {
      movies = searchResult['results'];
      genres = genresResult['genres'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (String? value) {
                setState(() {
                  searchValue = value!;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState!.save();
                  loadMovies();
                }
              },
              child: const Text('Search'),
            ),
            const SizedBox(
              height: 25,
            ),
            MoviesList(movies: movies, genres: genres, title: movies.length > 0 ? 'Search results :' : ''),
          ],
        ),
      ),
    );
  }
}
